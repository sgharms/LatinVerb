module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            class SecondBuilder
              def initialize(verb)
                @verb = verb
              end

              def build!
                @verb.instance_eval do
                  def active_voice_indicative_mood_future_tense
                    return TenseBlock.new(
                        [AF_ONE_TWO_ENDINGS.collect{|x| stem + x}].flatten,
                      { :meaning => MEANINGS[:active_voice_indicative_mood_future_tense] }
                      )
                  end

                  def active_voice_indicative_mood_imperfect_tense
                    return TenseBlock.new(
                      [AI_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten,
                      { :meaning => MEANINGS[:active_voice_indicative_mood_imperfect_tense] }
                      )
                  end

                  def active_voice_indicative_mood_present_tense
                    return TenseBlock.new(
                      [ first_person_singular,
                          AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending}
                         ].flatten,
                      { :meaning => MEANINGS[:active_voice_indicative_mood_present_tense] }
                      )
                  end

                  def active_voice_subjunctive_mood_present_tense
                    key = verb_type.ordinal_name_key
                    asp_base = ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-2])
                    elements = ['m',
                       AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending|
                         asp_base + ending
                    end

                    TenseBlock.new(
                      elements,
                      { :meaning => MEANINGS[:active_voice_subjunctive_mood_present_tense] }
                      )
                  end

                  def passive_voice_indicative_mood_future_tense
                    fp_stem = stem+"bi"
                    standards = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[2..-1].map{|x| fp_stem + x}
                    standards.pop
                    fp_stem.sub!(/.$/,'u')
                    elements = [stem + "b\xc5\x8dr",
                                stem + "beris",
                                standards,
                                fp_stem + PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.last].flatten!
                    TenseBlock.new(
                      elements,
                      { :meaning => MEANINGS[:passive_voice_indicative_mood_future_tense] }
                      )
                  end

                  def passive_voice_indicative_mood_imperfect_tense
                    imperfect_stem = stem + "b\xc4\x81"
                    elements = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| imperfect_stem + x}
                    return TenseBlock.new(
                      elements,
                      { :meaning => MEANINGS[:passive_voice_indicative_mood_imperfect_tense] }
                      )
                  end

                  def passive_voice_indicative_mood_present_tense
                    local_pe = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.clone
                    elements = [first_person_singular.to_s + "r",
                      local_pe[1..-1].map{|x| stem + x}].flatten!
                    return TenseBlock.new(
                      elements,
                      { :meaning => MEANINGS[:passive_voice_indicative_mood_present_tense] }
                      )
                  end

                  def passive_voice_subjunctive_mood_present_tense
                    key = verb_type.ordinal_name_key
                    short_base =
                      ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key].call(stem[0..-2])
                    elems = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
                       short_base + ending
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
      end
    end
  end
end
