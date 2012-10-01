module Linguistics
  module Latin
    module Verb
      class LatinVerb
        ##
        #
        # Some verbs only take a active/indic/pres/3rd/sg ("it rains").  For
        # these we will not add the full vectors of methods, but will only
        # respond to THAT vector.
        #
        ##
        module Impersonal
          def self.extended(extending_instance)
            extending_instance.instance_eval do
              prepare_present_only
            end
          end

          def prepare_present_only
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
