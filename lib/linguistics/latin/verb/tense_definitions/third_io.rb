# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2 wrap:

module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module ThirdIO
          def active_voice_indicative_mood_future_tense
            return TenseBlock.new(
              [Linguistics::Latin::Verb::AF_OTHER_ENDINGS.collect{|x| stem + "i" + x}].flatten,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_future_tense] }
            )
          end

          def active_voice_indicative_mood_imperfect_tense
            return TenseBlock.new(
              [Linguistics::Latin::Verb::AI_THIRD_CONJUG_PERS_ENDINGS.collect{ |x| stem + "i" + x } ].flatten!,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
            )
          end

          def active_voice_indicative_mood_present_tense
            return TenseBlock.new(
              [ first_person_singular, Linguistics::Latin::Verb::AP_THIRDIO_CONJG_PERS_ENDINGS.collect{ |ending| stem + ending } ].flatten!,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_indicative_mood_present_tense] }
            )
          end

          def active_voice_subjunctive_mood_present_tense
            key = verb_type.to_s.split(/::/).last.to_sym

            TenseBlock.new(
              ['m',
                   Linguistics::Latin::Verb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                 Linguistics::Latin::Verb::ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem) + ending
               end,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:active_voice_subjunctive_mood_present_tense] }
              )
          end

          def passive_voice_indicative_mood_future_tense
            ie_base = stem+"iē"
            elems = [
              stem+"ia"+Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[0],
              Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| ie_base + x}
            ].flatten!
            TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_future_tense] }
              )
          end

          def passive_voice_indicative_mood_imperfect_tense
            base  = stem+"iēbā"
            elems = [Linguistics::Latin::Verb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| base + x}].flatten!
            return TenseBlock.new(
              elems,
              { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
              )
          end

          def passive_voice_indicative_mood_present_tense
            base  = stem+"i"
            elems = [
              first_person_singular+"r",
              Linguistics::Latin::Verb::PASSIVE_ENDINGS_OTHER[1..-2].map{|x| stem + x},
              base+Linguistics::Latin::Verb::PASSIVE_ENDINGS_OTHER[-1]
            ].flatten!
            return TenseBlock.new(
              elems,
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

