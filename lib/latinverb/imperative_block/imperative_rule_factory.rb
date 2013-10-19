module Linguistics
  module Latin
    module Verb
      class ImperativeBlock
        class ImperativeRuleFactory
          MAPPING = {
            First: ->(stem, plural_present_imperative){ [stem, stem+"te"] },
            Second: ->(stem, plural_present_imperative){ [stem, stem+"te"] },
            ThirdIO: ->(stem, plural_present_imperative){ [stem+"e", stem+"ite"] },
            Third: ->(stem, plural_present_imperative){ [stem+"e", stem+"ite"] },
            Fourth: ->(stem, plural_present_imperative){ [stem+"ī", stem+"īte"] }
          }

          def initialize(verb)
            @verb = verb
          end

          def present_tense_rule
            MAPPING[type_key] || raise("Could not find mapping for #{type_key}")
          end

          private

          def verb_type
            @verb.verb_type
          end

          def type_key
            verb_type.ordinal_name_key
          end
        end
      end
    end
  end
end
