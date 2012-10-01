module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Impersonal
          def self.included(inclusor)
            impersonal_handler
          end
          def impersonal_handler
            singleton_class.class_eval do
              def active_voice_indicative_mood_present_tense
                TenseBlock.new ["", "", @original_string,
                                "", "", ""]
              end
              def active_voice_indicative_mood_present_tense_third_person_singular_number
                return active_voice_indicative_mood_present_tense[2]
              end
            end
          end
        end
      end
    end
  end
end

