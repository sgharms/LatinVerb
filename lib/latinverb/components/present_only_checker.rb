module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class PresentOnlyChecker
          def initialize(original_string)
            @original_string = original_string
          end

          def present_only?
            listed_as_present_only?
          end

          private

          def listed_as_present_only?
             Linguistics::Latin::Verb::PRESENT_ONLY.member?( first_person_present_tense ) ||
               Linguistics::Latin::Verb::PRESENT_ONLY.member?( present_active_infinitive )
          end

          def first_person_present_tense
            @original_string.split(/\s+/)[0]
          end

          def present_active_infinitive
            @original_string.split(/\s+/)[1]
          end
        end
      end
    end
  end
end
