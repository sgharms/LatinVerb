module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Fourth
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
              [AF_OTHER_ENDINGS.collect{|x| stem + "i" + x}].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_future_tense] }
              )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [AI_THIRD_CONJUG_PERS_ENDINGS.collect do |x|
                  stem + "i" + x end ].flatten!,
              { :meaning => MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
              )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [ first_person_singular,
                       AP_THIRDIO_CONJG_PERS_ENDINGS.collect{ |ending| stem + ending }
                     ].flatten!,
              { :meaning => MEANINGS[:active_voice_indicative_mood_present_tense] }
              )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.to_s.split(/::/).last.to_sym
            asp_base = ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-1])
            elems = ['m',
               AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                 asp_base + ending
            end

            TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            ie_base = stem + "iē"
            elems =  [stem + "ia" + PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[0],
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| ie_base + x}].flatten!
            TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            base = stem+"iēbā"
            elems = [PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| base + x}].flatten!
            return TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            base  = stem+"ī"
            elems = [first_person_singular+"r",
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-2].map{|x| base + x},
              base + PASSIVE_ENDINGS_OTHER[-1]].flatten!
            return TenseBlock.new(
              elems,
              { :meaning => MEANINGS[:passive_voice_indicative_mood_present_tense] }
              )
          end

          def passive_voice_subjunctive_mood_present_tense
            subjunctive_stem = stem + "iā"
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

