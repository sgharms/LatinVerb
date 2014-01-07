module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          class Third
            module ActiveVoiceSubjunctiveMoodPresentTenseMethods
              def active_voice_subjunctive_mood_present_tense
                key = verb_type.ordinal_name_key
                asp_base = stem[0..-1] + ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key]
                collection = ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten.map do  |ending|
                     asp_base + ending
                end

                TenseBlock.new(
                  collection,
                  { :meaning => MEANINGS[:active_voice_subjunctive_mood_present_tense] }
                  )
              end

              def active_voice_subjunctive_mood_present_tense_first_person_singular_number
                active_voice_subjunctive_mood_present_tense.first_person_singular_number
              end

              def active_voice_subjunctive_mood_present_tense_singular_number_first_person
                active_voice_subjunctive_mood_present_tense.singular_number_first_person
              end

              def active_voice_subjunctive_mood_present_tense_second_person_singular_number
                active_voice_subjunctive_mood_present_tense.second_person_singular_number
              end

              def active_voice_subjunctive_mood_present_tense_singular_number_second_person
                active_voice_subjunctive_mood_present_tense.singular_number_second_person
              end

              def active_voice_subjunctive_mood_present_tense_third_person_singular_number
                active_voice_subjunctive_mood_present_tense.third_person_singular_number
              end

              def active_voice_subjunctive_mood_present_tense_singular_number_third_person
                active_voice_subjunctive_mood_present_tense.singular_number_third_person
              end

              def active_voice_subjunctive_mood_present_tense_first_person_plural_number
                active_voice_subjunctive_mood_present_tense.first_person_plural_number
              end

              def active_voice_subjunctive_mood_present_tense_plural_number_first_person
                active_voice_subjunctive_mood_present_tense.plural_number_first_person
              end

              def active_voice_subjunctive_mood_present_tense_second_person_plural_number
                active_voice_subjunctive_mood_present_tense.second_person_plural_number
              end

              def active_voice_subjunctive_mood_present_tense_plural_number_second_person
                active_voice_subjunctive_mood_present_tense.plural_number_second_person
              end

              def active_voice_subjunctive_mood_present_tense_third_person_plural_number
                active_voice_subjunctive_mood_present_tense.third_person_plural_number
              end

              def active_voice_subjunctive_mood_present_tense_plural_number_third_person
                active_voice_subjunctive_mood_present_tense.plural_number_third_person
              end

              def active_voice_subjunctive_mood_present_tense_first_person
                active_voice_subjunctive_mood_present_tense.first_person
              end

              def active_voice_subjunctive_mood_present_tense_second_person
                active_voice_subjunctive_mood_present_tense.second_person
              end

              def active_voice_subjunctive_mood_present_tense_third_person
                active_voice_subjunctive_mood_present_tense.third_person
              end

              def active_voice_subjunctive_mood_present_tense_singular_number
                active_voice_subjunctive_mood_present_tense.singular_number
              end

              def active_voice_subjunctive_mood_present_tense_plural_number
                active_voice_subjunctive_mood_present_tense.plural_number
              end
            end
          end
        end
      end
    end
  end
end


