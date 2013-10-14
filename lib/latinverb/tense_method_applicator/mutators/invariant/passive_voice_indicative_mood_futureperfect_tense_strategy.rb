module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceIndicativeMoodFutureperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_indicative_mood_futureperfect_tense
                    elements = PASS_PERF_FUTURE_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle}   #{helping_verb}"  },
                    meaning = { :meaning => MEANINGS[:passive_voice_indicative_mood_futureperfect_tense] }
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
