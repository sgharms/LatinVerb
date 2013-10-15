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
        end
      end
    end
  end
end
