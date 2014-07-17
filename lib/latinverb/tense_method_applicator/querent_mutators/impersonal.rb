module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Impersonal
            def initialize(verb)
              @verb = verb
            end

            def mutate!
              @verb.instance_variable_get(:@qu).instance_eval do
                def active_voice_indicative_mood_present_tense
                  TenseBlock.new ["", "", @verb.original_string, "", "", ""]
                end

                def active_voice_indicative_mood_present_tense_third_person_singular_number
                  return @verb.active_voice_indicative_mood_present_tense[2]
                end
              end
            end
          end
        end
      end
    end
  end
end
