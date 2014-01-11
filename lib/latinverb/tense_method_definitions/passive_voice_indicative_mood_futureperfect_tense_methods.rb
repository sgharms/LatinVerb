module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module PassiveVoiceIndicativeMoodFutureperfectTenseMethods
            def passive_voice_indicative_mood_futureperfect_tense
              elements = PASS_PERF_FUTURE_ENDINGS.flat_map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}" }
              meaning = { :meaning => MEANINGS[:passive_voice_indicative_mood_futureperfect_tense] }
              TenseBlock.new(elements, meaning)
            end

            def passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number
              passive_voice_indicative_mood_futureperfect_tense.first_person_singular_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_singular_number_first_person
              passive_voice_indicative_mood_futureperfect_tense.singular_number_first_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number
              passive_voice_indicative_mood_futureperfect_tense.second_person_singular_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_singular_number_second_person
              passive_voice_indicative_mood_futureperfect_tense.singular_number_second_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number
              passive_voice_indicative_mood_futureperfect_tense.third_person_singular_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_singular_number_third_person
              passive_voice_indicative_mood_futureperfect_tense.singular_number_third_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number
              passive_voice_indicative_mood_futureperfect_tense.first_person_plural_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_plural_number_first_person
              passive_voice_indicative_mood_futureperfect_tense.plural_number_first_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number
              passive_voice_indicative_mood_futureperfect_tense.second_person_plural_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_plural_number_second_person
              passive_voice_indicative_mood_futureperfect_tense.plural_number_second_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number
              passive_voice_indicative_mood_futureperfect_tense.third_person_plural_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_plural_number_third_person
              passive_voice_indicative_mood_futureperfect_tense.plural_number_third_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_first_person
              passive_voice_indicative_mood_futureperfect_tense.first_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_second_person
              passive_voice_indicative_mood_futureperfect_tense.second_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_third_person
              passive_voice_indicative_mood_futureperfect_tense.third_person
            end

            def passive_voice_indicative_mood_futureperfect_tense_singular_number
              passive_voice_indicative_mood_futureperfect_tense.singular_number
            end

            def passive_voice_indicative_mood_futureperfect_tense_plural_number
              passive_voice_indicative_mood_futureperfect_tense.plural_number
            end
          end
        end
      end
    end
  end
end


