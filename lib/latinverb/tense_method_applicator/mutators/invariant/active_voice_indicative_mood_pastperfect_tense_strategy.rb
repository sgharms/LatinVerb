module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceIndicativeMoodPastperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_indicative_mood_pastperfect_tense
                    substem = first_person_perfect[0..-2]
                    elements = APERF_PAST_ENDINGS.flat_map{|x| substem + x}
                    meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_pastperfect_tense] }
                    return TenseBlock.new(elements, meaning)
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
