require_relative './mutator_for_verb_type'
require_relative './mutators/deponent'
require_relative './mutators/impersonal'
require_relative './mutators/invariant'
require_relative './mutators/irregular'
require_relative './mutators/present_only'
require_relative './mutators/regular'
require_relative './mutators/semideponent'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForClassificationFactory
            MAPPING = {
              Impersonal: Mutators::Impersonal,
              PresentOnly: Mutators::PresentOnly,
              Irregular: Mutators::Irregular,
              Deponent: Mutators::Deponent,
              Semideponent: Mutators::Semideponent,
              Regular: Mutators::Regular
            }

            def initialize(verb)
              @verb = verb
              @classification = verb.classification
            end

            def mutator
              MAPPING[@classification.short_name_key].new(@verb)
            end
          end
        end
      end
    end
  end
end
