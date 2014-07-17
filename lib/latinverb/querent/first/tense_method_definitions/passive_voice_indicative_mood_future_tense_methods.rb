module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          class First
            module PassiveVoiceIndicativeMoodFutureTenseMethods
              def passive_voice_indicative_mood_future_tense
                fp_stem   = stem + "bi"
                standards = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[2..-1].map{|x| fp_stem + x}
                standards.pop
                fp_stem.sub!(/.$/,'u')
                collection =
                  [ stem + "b\xc5\x8dr",
                    stem + "beris",
                    standards,
                    fp_stem + PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.last].flatten!

                TenseBlock.new(
                  collection,
                  { :meaning => MEANINGS[:passive_voice_indicative_mood_future_tense] }
                )
              end

              def passive_voice_indicative_mood_future_tense_first_person_singular_number
                passive_voice_indicative_mood_future_tense.first_person_singular_number
              end

              def passive_voice_indicative_mood_future_tense_singular_number_first_person
                passive_voice_indicative_mood_future_tense.singular_number_first_person
              end

              def passive_voice_indicative_mood_future_tense_second_person_singular_number
                passive_voice_indicative_mood_future_tense.second_person_singular_number
              end

              def passive_voice_indicative_mood_future_tense_singular_number_second_person
                passive_voice_indicative_mood_future_tense.singular_number_second_person
              end

              def passive_voice_indicative_mood_future_tense_third_person_singular_number
                passive_voice_indicative_mood_future_tense.third_person_singular_number
              end

              def passive_voice_indicative_mood_future_tense_singular_number_third_person
                passive_voice_indicative_mood_future_tense.singular_number_third_person
              end

              def passive_voice_indicative_mood_future_tense_first_person_plural_number
                passive_voice_indicative_mood_future_tense.first_person_plural_number
              end

              def passive_voice_indicative_mood_future_tense_plural_number_first_person
                passive_voice_indicative_mood_future_tense.plural_number_first_person
              end

              def passive_voice_indicative_mood_future_tense_second_person_plural_number
                passive_voice_indicative_mood_future_tense.second_person_plural_number
              end

              def passive_voice_indicative_mood_future_tense_plural_number_second_person
                passive_voice_indicative_mood_future_tense.plural_number_second_person
              end

              def passive_voice_indicative_mood_future_tense_third_person_plural_number
                passive_voice_indicative_mood_future_tense.third_person_plural_number
              end

              def passive_voice_indicative_mood_future_tense_plural_number_third_person
                passive_voice_indicative_mood_future_tense.plural_number_third_person
              end

              def passive_voice_indicative_mood_future_tense_first_person
                passive_voice_indicative_mood_future_tense.first_person
              end

              def passive_voice_indicative_mood_future_tense_second_person
                passive_voice_indicative_mood_future_tense.second_person
              end

              def passive_voice_indicative_mood_future_tense_third_person
                passive_voice_indicative_mood_future_tense.third_person
              end

              def passive_voice_indicative_mood_future_tense_singular_number
                passive_voice_indicative_mood_future_tense.singular_number
              end

              def passive_voice_indicative_mood_future_tense_plural_number
                passive_voice_indicative_mood_future_tense.plural_number
              end
            end
          end
        end
      end
    end
  end
end


