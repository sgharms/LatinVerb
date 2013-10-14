module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceIndicativeMoodFutureperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_indicative_mood_futureperfect_tense
                    substem = first_person_perfect[0..-2]
                    elements =  APERF_FUTURE_ENDINGS.flat_map{|x| substem + x}
                    meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_futureperfect_tense] }
                    TenseBlock.new(elements, meaning)
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
