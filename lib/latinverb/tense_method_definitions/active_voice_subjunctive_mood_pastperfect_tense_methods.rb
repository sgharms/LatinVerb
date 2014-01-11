module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module ActiveVoiceSubjunctiveMoodPastPerfectTenseMethods
            def active_voice_subjunctive_mood_pastperfect_tense
              asp_base = first_person_perfect[0..first_person_perfect.length-2] + "issē"
              elements =  ['m', *AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flat_map do |ending|
                asp_base + ending
              end
              meaning = { :meaning => MEANINGS[:active_voice_subjunctive_mood_pastperfect_tense] }
              TenseBlock.new(elements, meaning)
            end

            def active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
              active_voice_subjunctive_mood_pastperfect_tense.first_person_singular_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_singular_number_first_person
              active_voice_subjunctive_mood_pastperfect_tense.singular_number_first_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number
              active_voice_subjunctive_mood_pastperfect_tense.second_person_singular_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_singular_number_second_person
              active_voice_subjunctive_mood_pastperfect_tense.singular_number_second_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number
              active_voice_subjunctive_mood_pastperfect_tense.third_person_singular_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_singular_number_third_person
              active_voice_subjunctive_mood_pastperfect_tense.singular_number_third_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number
              active_voice_subjunctive_mood_pastperfect_tense.first_person_plural_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_plural_number_first_person
              active_voice_subjunctive_mood_pastperfect_tense.plural_number_first_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number
              active_voice_subjunctive_mood_pastperfect_tense.second_person_plural_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_plural_number_second_person
              active_voice_subjunctive_mood_pastperfect_tense.plural_number_second_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number
              active_voice_subjunctive_mood_pastperfect_tense.third_person_plural_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_plural_number_third_person
              active_voice_subjunctive_mood_pastperfect_tense.plural_number_third_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_first_person
              active_voice_subjunctive_mood_pastperfect_tense.first_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_second_person
              active_voice_subjunctive_mood_pastperfect_tense.second_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_third_person
              active_voice_subjunctive_mood_pastperfect_tense.third_person
            end

            def active_voice_subjunctive_mood_pastperfect_tense_singular_number
              active_voice_subjunctive_mood_pastperfect_tense.singular_number
            end

            def active_voice_subjunctive_mood_pastperfect_tense_plural_number
              active_voice_subjunctive_mood_pastperfect_tense.plural_number
            end
          end
        end
      end
    end
  end
end


