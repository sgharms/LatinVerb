module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Third
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
              [AF_OTHER_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_future_tense] }
              )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [AI_THIRD_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
              )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [AP_THIRD_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending } ].flatten!,
              { :meaning => MEANINGS[:active_voice_indicative_mood_present_tense] }
              )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.ordinal_name_key
            asp_base = ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-1])
            elems = ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                 asp_base + ending
            end

            TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            fp_stem = stem+"ē"
            standards = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| fp_stem + x}
            elems = [stem + "ar", standards].flatten!
            TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            ministem = stem + "ēbā"
            elems = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| ministem + x}
            return TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            return TenseBlock.new(
                [first_person_singular+"r",
                  PASSIVE_ENDINGS_OTHER[1..-1].map{|x| stem + x}].flatten!,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_present_tense] }
              )
          end

          def passive_voice_subjunctive_mood_present_tense
            subjunctive_stem = verb_type.to_s =~ /O$/i ? stem + "iā" : stem + "ā"
            elems = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
              subjunctive_stem + ending
            end
            TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_subjunctive_mood_present_tense] }
              )
          end
        end
      end
    end
  end
end

