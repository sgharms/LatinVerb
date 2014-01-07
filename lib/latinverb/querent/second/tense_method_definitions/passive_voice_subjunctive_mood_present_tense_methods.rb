module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          class Second
            module PassiveVoiceSubjunctiveMoodPresentTenseMethods
              def passive_voice_subjunctive_mood_present_tense
                key = verb_type.ordinal_name_key
                short_base =
                  stem[0..-2] + ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key]
                elems = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
                   short_base + ending
                end
                TenseBlock.new(
                  elems,
                  { :meaning => MEANINGS[:passive_voice_subjunctive_mood_present_tense] }
                  )
              end

              def passive_voice_subjunctive_mood_present_tense_first_person_singular_number
                passive_voice_subjunctive_mood_present_tense.first_person_singular_number
              end

              def passive_voice_subjunctive_mood_present_tense_singular_number_first_person
                passive_voice_subjunctive_mood_present_tense.singular_number_first_person
              end

              def passive_voice_subjunctive_mood_present_tense_second_person_singular_number
                passive_voice_subjunctive_mood_present_tense.second_person_singular_number
              end

              def passive_voice_subjunctive_mood_present_tense_singular_number_second_person
                passive_voice_subjunctive_mood_present_tense.singular_number_second_person
              end

              def passive_voice_subjunctive_mood_present_tense_third_person_singular_number
                passive_voice_subjunctive_mood_present_tense.third_person_singular_number
              end

              def passive_voice_subjunctive_mood_present_tense_singular_number_third_person
                passive_voice_subjunctive_mood_present_tense.singular_number_third_person
              end

              def passive_voice_subjunctive_mood_present_tense_first_person_plural_number
                passive_voice_subjunctive_mood_present_tense.first_person_plural_number
              end

              def passive_voice_subjunctive_mood_present_tense_plural_number_first_person
                passive_voice_subjunctive_mood_present_tense.plural_number_first_person
              end

              def passive_voice_subjunctive_mood_present_tense_second_person_plural_number
                passive_voice_subjunctive_mood_present_tense.second_person_plural_number
              end

              def passive_voice_subjunctive_mood_present_tense_plural_number_second_person
                passive_voice_subjunctive_mood_present_tense.plural_number_second_person
              end

              def passive_voice_subjunctive_mood_present_tense_third_person_plural_number
                passive_voice_subjunctive_mood_present_tense.third_person_plural_number
              end

              def passive_voice_subjunctive_mood_present_tense_plural_number_third_person
                passive_voice_subjunctive_mood_present_tense.plural_number_third_person
              end

              def passive_voice_subjunctive_mood_present_tense_first_person
                passive_voice_subjunctive_mood_present_tense.first_person
              end

              def passive_voice_subjunctive_mood_present_tense_second_person
                passive_voice_subjunctive_mood_present_tense.second_person
              end

              def passive_voice_subjunctive_mood_present_tense_third_person
                passive_voice_subjunctive_mood_present_tense.third_person
              end

              def passive_voice_subjunctive_mood_present_tense_singular_number
                passive_voice_subjunctive_mood_present_tense.singular_number
              end

              def passive_voice_subjunctive_mood_present_tense_plural_number
                passive_voice_subjunctive_mood_present_tense.plural_number
              end
            end
          end
        end
      end
    end
  end
end


