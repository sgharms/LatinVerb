module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceSubjunctiveMoodPerfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_subjunctive_mood_perfect_tense
                    counter = -1
                    elements = PASS_PERF_SUBJUNCTIVE_ENDINGS.map do |ending|
                      counter += 1
                      (counter <= 2 ?
                      "[ #{triplicate_and_genderize passive_perfect_participle} ]" :
                      "[ #{pluralize_participial_listing(triplicate_and_genderize(passive_perfect_participle))} ]" )+ " " + ending
                    end
                    meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_perfect_tense] }
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
