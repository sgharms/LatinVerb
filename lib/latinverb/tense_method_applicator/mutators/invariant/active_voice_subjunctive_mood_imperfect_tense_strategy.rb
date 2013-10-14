module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            class ActiveVoiceSubjunctiveMoodImperfectTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_subjunctive_mood_imperfect_tense
                    elements = 'm', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.flatten_map do |ending|
                      present_active_infinitive.sub(/e$/,'ē') + ending
                    end
                    meaning = { :meaning => MEANINGS[:active_voice_subjunctive_mood_imperfect_tense] }
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
