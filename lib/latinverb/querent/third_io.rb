
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ThirdIOQuerent < Querent
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
              [AF_OTHER_ENDINGS.collect{|x| stem + "i" + x}].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_future_tense] }
            )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [AI_THIRD_CONJUG_PERS_ENDINGS.collect{ |x| stem + "i" + x } ].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
            )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [ first_person_singular, AP_THIRDIO_CONJG_PERS_ENDINGS.collect{ |ending| stem + ending } ].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_present_tense] }
            )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.ordinal_name_key
            endings = ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS]
            collection = endings.flatten.map do  |ending|
               stem + ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key] + ending
             end

            TenseBlock.new(
              collection,
              { :meaning => MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            ie_base = stem + "iē"
            collection = [
              stem + "ia" + PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[0],
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| ie_base + x}
            ].flatten
            TenseBlock.new(
              collection,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            base  = stem + "iēbā"
            collection = [PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| base + x}].flatten
            return TenseBlock.new(
              collection,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            base  = stem + "i"
            collection = [
              first_person_singular + "r",
              PASSIVE_ENDINGS_OTHER[1..-2].map{|x| stem + x},
              base + PASSIVE_ENDINGS_OTHER[-1]
            ].flatten
            return TenseBlock.new(
              collection,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_present_tense] }
              )
          end

          def passive_voice_subjunctive_mood_present_tense
            subjunctive_stem = verb_type.to_s =~ /O$/i ? stem + "iā" : stem + "ā"
            collection = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
              subjunctive_stem + ending
            end
            TenseBlock.new(
              collection,
              { :meaning => MEANINGS[:passive_voice_subjunctive_mood_present_tense] }
              )
          end
        end
      end
    end
  end
end
