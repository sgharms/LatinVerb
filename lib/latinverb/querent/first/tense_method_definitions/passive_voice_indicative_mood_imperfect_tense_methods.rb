module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          class First
            module PassivevoiceIndicativeMoodImperfectTenseMethods
              def passive_voice_indicative_mood_imperfect_tense
                imperfect_stem = stem + "b\xc4\x81"
                collection = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| imperfect_stem + x}
                TenseBlock.new( collection,
                               { :meaning => MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
                              )
              end

              def passive_voice_indicative_mood_imperfect_tense_first_person_singular_number
                passive_voice_indicative_mood_imperfect_tense.first_person_singular_number
              end

              def passive_voice_indicative_mood_imperfect_tense_singular_number_first_person
                passive_voice_indicative_mood_imperfect_tense.singular_number_first_person
              end

              def passive_voice_indicative_mood_imperfect_tense_second_person_singular_number
                passive_voice_indicative_mood_imperfect_tense.second_person_singular_number
              end

              def passive_voice_indicative_mood_imperfect_tense_singular_number_second_person
                passive_voice_indicative_mood_imperfect_tense.singular_number_second_person
              end

              def passive_voice_indicative_mood_imperfect_tense_third_person_singular_number
                passive_voice_indicative_mood_imperfect_tense.third_person_singular_number
              end

              def passive_voice_indicative_mood_imperfect_tense_singular_number_third_person
                passive_voice_indicative_mood_imperfect_tense.singular_number_third_person
              end

              def passive_voice_indicative_mood_imperfect_tense_first_person_plural_number
                passive_voice_indicative_mood_imperfect_tense.first_person_plural_number
              end

              def passive_voice_indicative_mood_imperfect_tense_plural_number_first_person
                passive_voice_indicative_mood_imperfect_tense.plural_number_first_person
              end

              def passive_voice_indicative_mood_imperfect_tense_second_person_plural_number
                passive_voice_indicative_mood_imperfect_tense.second_person_plural_number
              end

              def passive_voice_indicative_mood_imperfect_tense_plural_number_second_person
                passive_voice_indicative_mood_imperfect_tense.plural_number_second_person
              end

              def passive_voice_indicative_mood_imperfect_tense_third_person_plural_number
                passive_voice_indicative_mood_imperfect_tense.third_person_plural_number
              end

              def passive_voice_indicative_mood_imperfect_tense_plural_number_third_person
                passive_voice_indicative_mood_imperfect_tense.plural_number_third_person
              end

              def passive_voice_indicative_mood_imperfect_tense_first_person
                passive_voice_indicative_mood_imperfect_tense.first_person
              end

              def passive_voice_indicative_mood_imperfect_tense_second_person
                passive_voice_indicative_mood_imperfect_tense.second_person
              end

              def passive_voice_indicative_mood_imperfect_tense_third_person
                passive_voice_indicative_mood_imperfect_tense.third_person
              end

              def passive_voice_indicative_mood_imperfect_tense_singular_number
                passive_voice_indicative_mood_imperfect_tense.singular_number
              end

              def passive_voice_indicative_mood_imperfect_tense_plural_number
                passive_voice_indicative_mood_imperfect_tense.plural_number
              end
            end
          end
        end
      end
    end
  end
end


