module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceSubjunctiveMoodPastperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_subjunctive_mood_pastperfect_tense
                    count = -1
                    elements = PASS_PLUPERF_PAST_ENDINGS.map do |ending|
                      count += 1
                      (count <= 2 ?
                        "[ #{TriplicateAndPluralizeFormatters.triplicate_and_genderize(passive_perfect_participle)} ]" :
                        "[ #{TriplicateAndPluralizeFormatters.pluralize_participial_listing(passive_perfect_participle)} ]" )+ " " + ending
                    end
                    meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_pastperfect_tense] }
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
