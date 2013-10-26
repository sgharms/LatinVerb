require_relative './mutator_for_verb_type'
require_relative './querent_mutators/deponent'
require_relative './querent_mutators/impersonal'
require_relative './querent_mutators/invariant'
require_relative './querent_mutators/irregular'
require_relative './querent_mutators/present_only'
require_relative './querent_mutators/regular'
require_relative './querent_mutators/semideponent'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForClassificationFactoryForQuerent
            attr_reader :mutator_class

            MAPPING = {
              Impersonal: QuerentMutators::Impersonal,
              PresentOnly: QuerentMutators::PresentOnly,
              Irregular: QuerentMutators::Irregular,
              Deponent: QuerentMutators::Deponent,
              Semideponent: QuerentMutators::Semideponent,
              Regular: QuerentMutators::Regular
            }

            def initialize(verb, querent)
              @verb = verb
              @querent = querent
              @classification = verb.classification
            end

            def mutator
              @mutator_class = MAPPING[@classification.short_name_key]
              @mutator_class.new(@verb)
            end
          end
        end
      end
    end
  end
end
