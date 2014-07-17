module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            ##
            #
            # === GRAMMATICAL FUNCTION
            #
            # Action completed in the future.
            # A&G,160,b,3.
            #
            ###
            class ActiveVoiceIndicativeMoodFutureTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_indicative_mood_futureperfect_tense
                    substem = first_person_perfect[0..-2]
                    return TenseBlock.new [APERF_FUTURE_ENDINGS.collect{|x| substem + x}].flatten,
                           { :meaning => MEANINGS[:active_voice_indicative_mood_futureperfect_tense] }
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
