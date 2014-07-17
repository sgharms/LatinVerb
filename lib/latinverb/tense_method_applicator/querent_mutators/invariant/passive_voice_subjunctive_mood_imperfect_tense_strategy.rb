module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class PassiveVoiceSubjunctiveMoodImperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def passive_voice_subjunctive_mood_imperfect_tense
                    base = present_active_infinitive.gsub(/(.*)(.)$/,"\\1" + 'ē')
                    elements = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
                      base + ending
                    end
                    meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_imperfect_tense] }
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
