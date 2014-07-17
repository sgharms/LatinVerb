module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class IrregularQuerent < Querent
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
