module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            extend Forwardable
            def_delegators :@verb, :verb_type

            MAPPING = {
              First: Linguistics::Latin::Verb::TenseDefinitions::First,
              Second: Linguistics::Latin::Verb::TenseDefinitions::First,
              ThirdIO: Linguistics::Latin::Verb::TenseDefinitions::ThirdIO,
              Third: Linguistics::Latin::Verb::TenseDefinitions::Third,
              Fourth: Linguistics::Latin::Verb::TenseDefinitions::Fourth,
              Irregular: Linguistics::Latin::Verb::TenseDefinitions::Irregular
            }

            def initialize(verb)
              @verb = verb
            end

            def mutate!
              @verb.extend MAPPING[verb_type.ordinal_name_key]
            end
          end
        end
      end
    end
  end
end
