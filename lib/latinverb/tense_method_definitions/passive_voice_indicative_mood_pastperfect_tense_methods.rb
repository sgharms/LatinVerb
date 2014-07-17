module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module PassiveVoiceIndicativeMoodPastperfectTenseMethods
            def passive_voice_indicative_mood_pastperfect_tense
              elements = Linguistics::Latin::Verb::PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  }
              meaning = { :meaning =>  Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_pastperfect_tense]}
              TenseBlock.new(elements, meaning)
            end

            def passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number
              passive_voice_indicative_mood_pastperfect_tense.first_person_singular_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_singular_number_first_person
              passive_voice_indicative_mood_pastperfect_tense.singular_number_first_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number
              passive_voice_indicative_mood_pastperfect_tense.second_person_singular_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_singular_number_second_person
              passive_voice_indicative_mood_pastperfect_tense.singular_number_second_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number
              passive_voice_indicative_mood_pastperfect_tense.third_person_singular_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_singular_number_third_person
              passive_voice_indicative_mood_pastperfect_tense.singular_number_third_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number
              passive_voice_indicative_mood_pastperfect_tense.first_person_plural_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_plural_number_first_person
              passive_voice_indicative_mood_pastperfect_tense.plural_number_first_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number
              passive_voice_indicative_mood_pastperfect_tense.second_person_plural_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_plural_number_second_person
              passive_voice_indicative_mood_pastperfect_tense.plural_number_second_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number
              passive_voice_indicative_mood_pastperfect_tense.third_person_plural_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_plural_number_third_person
              passive_voice_indicative_mood_pastperfect_tense.plural_number_third_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_first_person
              passive_voice_indicative_mood_pastperfect_tense.first_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_second_person
              passive_voice_indicative_mood_pastperfect_tense.second_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_third_person
              passive_voice_indicative_mood_pastperfect_tense.third_person
            end

            def passive_voice_indicative_mood_pastperfect_tense_singular_number
              passive_voice_indicative_mood_pastperfect_tense.singular_number
            end

            def passive_voice_indicative_mood_pastperfect_tense_plural_number
              passive_voice_indicative_mood_pastperfect_tense.plural_number
            end
          end
        end
      end
    end
  end
end


