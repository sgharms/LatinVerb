module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DefectiveChecker
          extend Forwardable
          def_delegators :@verb, :first_person_singular, :present_active_infinitive

          def initialize(verb)
            @verb = verb
          end

          def defective?
            Linguistics::Latin::Verb::PRESENT_ONLY.member?(first_person_singular) ||
              Linguistics::Latin::Verb::PRESENT_ONLY.member?(present_active_infinitive)
          end
        end
      end
    end
  end
end
