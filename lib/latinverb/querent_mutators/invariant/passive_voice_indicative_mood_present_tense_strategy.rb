module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceIndicativeMoodPresentTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_indicative_mood_present_tense
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
