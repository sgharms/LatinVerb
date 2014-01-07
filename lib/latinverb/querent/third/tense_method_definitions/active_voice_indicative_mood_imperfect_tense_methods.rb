module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          class Third
            module ActiveVoiceIndicativeMoodImperfectTenseMethods
              def active_voice_indicative_mood_imperfect_tense
                return TenseBlock.new(
                  [AI_THIRD_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten,
                  { :meaning => MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
                  )
              end

              def active_voice_indicative_mood_imperfect_tense_first_person_singular_number
                active_voice_indicative_mood_imperfect_tense.first_person_singular_number
              end

              def active_voice_indicative_mood_imperfect_tense_singular_number_first_person
                active_voice_indicative_mood_imperfect_tense.singular_number_first_person
              end

              def active_voice_indicative_mood_imperfect_tense_second_person_singular_number
                active_voice_indicative_mood_imperfect_tense.second_person_singular_number
              end

              def active_voice_indicative_mood_imperfect_tense_singular_number_second_person
                active_voice_indicative_mood_imperfect_tense.singular_number_second_person
              end

              def active_voice_indicative_mood_imperfect_tense_third_person_singular_number
                active_voice_indicative_mood_imperfect_tense.third_person_singular_number
              end

              def active_voice_indicative_mood_imperfect_tense_singular_number_third_person
                active_voice_indicative_mood_imperfect_tense.singular_number_third_person
              end

              def active_voice_indicative_mood_imperfect_tense_first_person_plural_number
                active_voice_indicative_mood_imperfect_tense.first_person_plural_number
              end

              def active_voice_indicative_mood_imperfect_tense_plural_number_first_person
                active_voice_indicative_mood_imperfect_tense.plural_number_first_person
              end

              def active_voice_indicative_mood_imperfect_tense_second_person_plural_number
                active_voice_indicative_mood_imperfect_tense.second_person_plural_number
              end

              def active_voice_indicative_mood_imperfect_tense_plural_number_second_person
                active_voice_indicative_mood_imperfect_tense.plural_number_second_person
              end

              def active_voice_indicative_mood_imperfect_tense_third_person_plural_number
                active_voice_indicative_mood_imperfect_tense.third_person_plural_number
              end

              def active_voice_indicative_mood_imperfect_tense_plural_number_third_person
                active_voice_indicative_mood_imperfect_tense.plural_number_third_person
              end

              def active_voice_indicative_mood_imperfect_tense_first_person
                active_voice_indicative_mood_imperfect_tense.first_person
              end

              def active_voice_indicative_mood_imperfect_tense_second_person
                active_voice_indicative_mood_imperfect_tense.second_person
              end

              def active_voice_indicative_mood_imperfect_tense_third_person
                active_voice_indicative_mood_imperfect_tense.third_person
              end

              def active_voice_indicative_mood_imperfect_tense_singular_number
                active_voice_indicative_mood_imperfect_tense.singular_number
              end

              def active_voice_indicative_mood_imperfect_tense_plural_number
                active_voice_indicative_mood_imperfect_tense.plural_number
              end
            end
          end
        end
      end
    end
  end
end


