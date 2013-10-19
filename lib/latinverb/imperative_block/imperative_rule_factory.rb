module Linguistics
  module Latin
    module Verb
      class ImperativeBlock
        class ImperativeRuleFactory
          MAPPING = {
            first: ->(stem, plural_present_imperative){ [stem, stem+"te"] },
            second: ->(stem, plural_present_imperative){ [stem, stem+"te"] },
            thirdio: ->(stem, plural_present_imperative){ [stem+"e", stem+"ite"] },
            third: ->(stem, plural_present_imperative){ [stem+"e", stem+"ite"] },
            fourth: ->(stem, plural_present_imperative){ [stem+"ī", stem+"īte"] }
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
            verb_type.to_s.split('::').last.downcase.to_sym
          end
        end
      end
    end
  end
end
