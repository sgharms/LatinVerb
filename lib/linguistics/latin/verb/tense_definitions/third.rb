# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2:

module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Third
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
              [Linguistics::Latin::Verb::AF_OTHER_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_future_tense] }
              )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [Linguistics::Latin::Verb::AI_THIRD_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
              )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [ Linguistics::Latin::Verb::AP_THIRD_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending } ].flatten!,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_present_tense] }
              )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.to_s.split(/::/).last.to_sym
            asp_base = Linguistics::Latin::Verb::ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-1])
            elems = ['m',
               Linguistics::Latin::Verb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                 asp_base + ending
            end

            TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            fp_stem = stem+"ē"
            standards = Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| fp_stem + x}
            elems = [stem + "ar", standards].flatten!
            TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            ministem = stem + "ēbā"
            elems = Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| ministem + x}
            return TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            return TenseBlock.new(
                [first_person_singular+"r",
                  Linguistics::Latin::Verb::PASSIVE_ENDINGS_OTHER[1..-1].map{|x| stem + x}].flatten!,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_present_tense] }
              )
          end

          def passive_voice_subjunctive_mood_present_tense
            subjunctive_stem = verb_type.to_s =~ /O$/i ? stem + "iā" : stem + "ā"
            elems = Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
              subjunctive_stem + ending
            end
            TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_present_tense] }
              )
          end
        end
      end
    end
  end
end

