module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            extend Forwardable
            def_delegators :@verb, :verb_type

            MAPPING = {
              first: Linguistics::Latin::Verb::TenseDefinitions::First,
              second: Linguistics::Latin::Verb::TenseDefinitions::First,
              thirdio: Linguistics::Latin::Verb::TenseDefinitions::ThirdIO,
              third: Linguistics::Latin::Verb::TenseDefinitions::Third,
              fourth: Linguistics::Latin::Verb::TenseDefinitions::Fourth,
              irregular: Linguistics::Latin::Verb::TenseDefinitions::Irregular
            }

            def initialize(verb)
              @verb = verb
            end

            def mutate!
              @verb.extend MAPPING[key]
            end

            private

            def key
              mod_path.split('::').last.downcase.to_sym
            end

            def mod_path
              verb_type.to_s
            end
          end
        end
      end
    end
  end
end
