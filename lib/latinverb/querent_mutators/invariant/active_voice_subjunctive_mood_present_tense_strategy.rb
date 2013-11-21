module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceSubjunctiveMoodPresentTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_subjunctive_mood_present_tense
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
