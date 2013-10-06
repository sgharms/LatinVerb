require_relative './tense_method_applicator/defective_checker'
require_relative './tense_method_applicator/impersonal'
require_relative './tense_method_applicator/semideponent'
require_relative './tense_method_applicator/irregular'
require_relative './tense_method_applicator/deponent'
require_relative './tense_method_applicator/deponent_tense_methods'
require_relative './tense_method_applicator/deponent_string_deriver'
require_relative './tense_method_applicator/perfect_tense_remover'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          extend Forwardable
          def_delegators :@verb, :classified_as

          def initialize(verb)
            @verb = verb
            @verb.extend Linguistics::Latin::Verb::TenseDefinitions::Invariant
            load_tense_methods_based_on_verb_type
            include_classification_specific_mixins
            mutate_defectives if is_defective?
          end

          private

          def load_tense_methods_based_on_verb_type
            mod_path = @verb.verb_type.inspect.to_s
            return if mod_path.empty?
            mod_path.sub!('VerbTypes', 'TenseDefinitions' )
            the_mod = mod_path.split('::').inject(Object) do |mod, class_name|
              mod.const_get(class_name)
            end
            @verb.extend the_mod
          end

          def include_classification_specific_mixins
            the_mod = if classified_as.impersonal?
               Linguistics::Latin::Verb::Impersonal
            elsif classified_as.irregular?
               Linguistics::Latin::Verb::Irregular
            elsif classified_as.deponent?
               Linguistics::Latin::Verb::Deponent
            elsif classified_as.semideponent?
               Linguistics::Latin::Verb::Semideponent
            elsif classified_as.present_only?
               Linguistics::Latin::Verb::PresentOnly
            end

            return unless the_mod

            @verb.instance_eval do
              self.extend the_mod
            end
          end

          def is_defective?
            DefectiveChecker::is_it_defective?(@verb)
          end

          def mutate_defectives
            @verb.set_as_defective
            remove_perfect_tenses
          end

          def remove_perfect_tenses
            PerfectTenseRemover.new(@verb)
            tense_blocks_to_eclipse =
              @verb.methods.grep( /^(active|passive).*(_|past|future)perfect_/ )

            tense_blocks_to_eclipse.each do |s|
              @verb.singleton_class.class_eval do
                define_method s do
                  return NullTenseBlock.new
                end
              end
            end
          end
        end
      end
    end
  end
end
