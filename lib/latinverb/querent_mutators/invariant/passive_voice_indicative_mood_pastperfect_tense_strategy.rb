module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceIndicativeMoodPastperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_indicative_mood_pastperfect_tense
                    elements = Linguistics::Latin::Verb::PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  }
                    meaning = { :meaning =>  Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_pastperfect_tense]}
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
