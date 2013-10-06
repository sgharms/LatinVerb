module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module DefectiveChecker
          def self.is_it_defective?(instance)
            first_person_present_tense = instance.first_person_singular
            present_active_infinitive  = instance.present_active_infinitive
            found = Linguistics::Latin::Verb::PRESENT_ONLY.member?( first_person_present_tense ) ||
                    Linguistics::Latin::Verb::PRESENT_ONLY.member?( present_active_infinitive )
            return Linguistics::Latin::Verb::Classification::PresentOnly if found
          end
        end
      end
    end
  end
end
