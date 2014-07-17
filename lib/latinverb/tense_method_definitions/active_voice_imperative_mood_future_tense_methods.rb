module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module ActiveVoiceImperativeMoodFutureTenseMethods
            def active_voice_imperative_mood_future_tense
              f = imperatives.future
              TenseBlock.new(
                [ '', f[0], f[2], '', f[1], f[3] ],
                { :meaning => MEANINGS[:active_voice_imperative_mood_future_tense] }
              )
            end

            def active_voice_imperative_mood_future_tense_first_person_singular_number
              active_voice_imperative_mood_future_tense.first_person_singular_number
            end

            def active_voice_imperative_mood_future_tense_singular_number_first_person
              active_voice_imperative_mood_future_tense.singular_number_first_person
            end

            def active_voice_imperative_mood_future_tense_second_person_singular_number
              active_voice_imperative_mood_future_tense.second_person_singular_number
            end

            def active_voice_imperative_mood_future_tense_singular_number_second_person
              active_voice_imperative_mood_future_tense.singular_number_second_person
            end

            def active_voice_imperative_mood_future_tense_third_person_singular_number
              active_voice_imperative_mood_future_tense.third_person_singular_number
            end

            def active_voice_imperative_mood_future_tense_singular_number_third_person
              active_voice_imperative_mood_future_tense.singular_number_third_person
            end

            def active_voice_imperative_mood_future_tense_first_person_plural_number
              active_voice_imperative_mood_future_tense.first_person_plural_number
            end

            def active_voice_imperative_mood_future_tense_plural_number_first_person
              active_voice_imperative_mood_future_tense.plural_number_first_person
            end

            def active_voice_imperative_mood_future_tense_second_person_plural_number
              active_voice_imperative_mood_future_tense.second_person_plural_number
            end

            def active_voice_imperative_mood_future_tense_plural_number_second_person
              active_voice_imperative_mood_future_tense.plural_number_second_person
            end

            def active_voice_imperative_mood_future_tense_third_person_plural_number
              active_voice_imperative_mood_future_tense.third_person_plural_number
            end

            def active_voice_imperative_mood_future_tense_plural_number_third_person
              active_voice_imperative_mood_future_tense.plural_number_third_person
            end

            def active_voice_imperative_mood_future_tense_first_person
              active_voice_imperative_mood_future_tense.first_person
            end

            def active_voice_imperative_mood_future_tense_second_person
              active_voice_imperative_mood_future_tense.second_person
            end

            def active_voice_imperative_mood_future_tense_third_person
              active_voice_imperative_mood_future_tense.third_person
            end

            def active_voice_imperative_mood_future_tense_singular_number
              active_voice_imperative_mood_future_tense.singular_number
            end

            def active_voice_imperative_mood_future_tense_plural_number
              active_voice_imperative_mood_future_tense.plural_number
            end
          end
        end
      end
    end
  end
end
