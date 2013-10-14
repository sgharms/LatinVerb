module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceImperativeMoodFutureTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_imperative_mood_future_tense
                    f = imperatives.future
                    return TenseBlock.new(
                      [ '', f[0], f[2], '', f[1], f[3] ],
                      { :meaning => MEANINGS[:active_voice_imperative_mood_future_tense] }
                     )
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
