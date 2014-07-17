require_relative 'type_tense_definitions/third'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            class ThirdBuilder
              def initialize(verb)
                @verb = verb
              end

              def build!
                @verb.extend(TypeTenseDefinition::Third)
              end
            end
          end
        end
      end
    end
  end
end
