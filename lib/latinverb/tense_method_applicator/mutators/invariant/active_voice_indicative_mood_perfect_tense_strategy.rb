module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceIndicativeMoodPerfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_indicative_mood_perfect_tense
                  substem = first_person_perfect[0..-2]
                  elements = [first_person_perfect.to_s, APERF_ENDINGS.flat_map{|x| substem + x.to_s}]
                  meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_perfect_tense] }
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
