module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module ImpersonalVerbMixin
          def active_voice_indicative_mood_present_tense
            TenseBlock.new ["", "", @verb.original_string, "", "", ""]
          end
        end
      end
    end
  end
end
