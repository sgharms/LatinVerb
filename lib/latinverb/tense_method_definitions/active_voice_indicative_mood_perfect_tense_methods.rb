module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module ActiveVoiceIndicativeMoodPerfectTenseMethods
            def active_voice_indicative_mood_perfect_tense
              substem = first_person_perfect[0..-2]
              elements = APERF_ENDINGS.flat_map{|x| substem + x.to_s}
              elements.unshift first_person_perfect
              meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_perfect_tense] }
              TenseBlock.new(elements, meaning)
            end

            def active_voice_indicative_mood_perfect_tense_first_person_singular_number
              active_voice_indicative_mood_perfect_tense.first_person_singular_number
            end

            def active_voice_indicative_mood_perfect_tense_singular_number_first_person
              active_voice_indicative_mood_perfect_tense.singular_number_first_person
            end

            def active_voice_indicative_mood_perfect_tense_second_person_singular_number
              active_voice_indicative_mood_perfect_tense.second_person_singular_number
            end

            def active_voice_indicative_mood_perfect_tense_singular_number_second_person
              active_voice_indicative_mood_perfect_tense.singular_number_second_person
            end

            def active_voice_indicative_mood_perfect_tense_third_person_singular_number
              active_voice_indicative_mood_perfect_tense.third_person_singular_number
            end

            def active_voice_indicative_mood_perfect_tense_singular_number_third_person
              active_voice_indicative_mood_perfect_tense.singular_number_third_person
            end

            def active_voice_indicative_mood_perfect_tense_first_person_plural_number
              active_voice_indicative_mood_perfect_tense.first_person_plural_number
            end

            def active_voice_indicative_mood_perfect_tense_plural_number_first_person
              active_voice_indicative_mood_perfect_tense.plural_number_first_person
            end

            def active_voice_indicative_mood_perfect_tense_second_person_plural_number
              active_voice_indicative_mood_perfect_tense.second_person_plural_number
            end

            def active_voice_indicative_mood_perfect_tense_plural_number_second_person
              active_voice_indicative_mood_perfect_tense.plural_number_second_person
            end

            def active_voice_indicative_mood_perfect_tense_third_person_plural_number
              active_voice_indicative_mood_perfect_tense.third_person_plural_number
            end

            def active_voice_indicative_mood_perfect_tense_plural_number_third_person
              active_voice_indicative_mood_perfect_tense.plural_number_third_person
            end

            def active_voice_indicative_mood_perfect_tense_first_person
              active_voice_indicative_mood_perfect_tense.first_person
            end

            def active_voice_indicative_mood_perfect_tense_second_person
              active_voice_indicative_mood_perfect_tense.second_person
            end

            def active_voice_indicative_mood_perfect_tense_third_person
              active_voice_indicative_mood_perfect_tense.third_person
            end

            def active_voice_indicative_mood_perfect_tense_singular_number
              active_voice_indicative_mood_perfect_tense.singular_number
            end

            def active_voice_indicative_mood_perfect_tense_plural_number
              active_voice_indicative_mood_perfect_tense.plural_number
            end
          end
        end
      end
    end
  end
end


