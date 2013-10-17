require_relative './tense_method_applicator/defective_checker'
require_relative './tense_method_applicator/deponent_string_deriver'
require_relative './tense_method_applicator/perfect_tense_remover'
require_relative './tense_method_applicator/mutator_for_classification_factory'
require_relative './tense_method_applicator/mutators/impersonal'
require_relative './tense_method_applicator/mutators/irregular'
require_relative './tense_method_applicator/mutators/deponent'
require_relative './tense_method_applicator/mutators/regular'
require_relative './tense_method_applicator/mutators/semideponent'
require_relative './tense_method_applicator/mutators/invariant'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          extend Forwardable
          def_delegators :@verb, :classified_as

          def initialize(verb)
            @verb = verb
            load_tense_methods_unvarying_with_verb_type
            load_tense_methods_based_on_verb_type
            include_classification_specific_mixins
            mutate_defectives if is_defective?
            apply_final_vectors
          end

          private

          def load_tense_methods_unvarying_with_verb_type
            Mutators::Invariant.new(@verb)
          end

          def find_tense_definition_class
            mod_path = @verb.verb_type.inspect.to_s
            return if mod_path.empty?
            mod_path.sub!('VerbTypes', 'TenseDefinitions' )
            mod_path.split('::').inject(Object) do |mod, class_name|
              mod.const_get(class_name)
            end
          end

          def load_tense_methods_based_on_verb_type
            @verb.extend find_tense_definition_class
          end

          def include_classification_specific_mixins
            MutatorForClassificationFactory.new(@verb).mutator.mutate!
          end

          def is_defective?
            DefectiveChecker::is_it_defective?(@verb)
          end

          def mutate_defectives
            @verb.set_as_defective
            remove_perfect_tenses
          end

          def remove_perfect_tenses
            PerfectTenseRemover.new(@verb).remove!
          end

          def apply_final_vectors
            final_vectors = {
              0 => [ :first_person_singular_number, :singular_number_first_person ],
              1 => [ :second_person_singular_number, :singular_number_second_person ],
              2 => [ :third_person_singular_number, :singular_number_third_person ],
              3 => [ :first_person_plural_number, :plural_number_first_person ],
              4 => [ :second_person_plural_number, :plural_number_second_person ],
              5 => [ :third_person_plural_number, :plural_number_third_person ]
            }

            verb = @verb
            @verb.tense_list.each do | tense_block_method |
              final_vectors.each_pair do | tense_block_location, accessors |
                accessors.each do | accessor |
                  new_method = [tense_block_method, accessor].map(&:to_s).join('_').to_sym
                  verb.singleton_class.instance_eval do
                    define_method new_method, Proc.new{ verb.send(tense_block_method)[tense_block_location] }
                  end
                end
              end

              @verb.singleton_class.class_eval do
                define_method("#{tense_block_method}_first_person", Proc.new do
                  [ self.send(tense_block_method)[0],
                    self.send(tense_block_method)[3] ]
                end)

                define_method("#{tense_block_method}_second_person", Proc.new do
                  [ self.send(tense_block_method)[1],
                    self.send(tense_block_method)[4] ]
                end)

                define_method("#{tense_block_method}_third_person", Proc.new do
                  [ self.send(tense_block_method)[2],
                    self.send(tense_block_method)[5] ]
                end)

                define_method("#{tense_block_method}_singular_number", Proc.new do
                  [ self.send(tense_block_method)[0],
                    self.send(tense_block_method)[1],
                    self.send(tense_block_method)[2] ]
                end)

                define_method("#{tense_block_method}_plural_number", Proc.new do
                  [ self.send(tense_block_method)[3],
                    self.send(tense_block_method)[4],
                    self.send(tense_block_method)[5] ]
                end)
              end
            end
          end
        end
      end
    end
  end
end
