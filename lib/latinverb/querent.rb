#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          extend Forwardable
          def_delegators :@verb, :stem, :imperatives, :first_person_singular, :first_person_perfect,
            :present_active_infinitive, :passive_perfect_participle, :present_active_infinitive, :verb_type

          def initialize(verb)
            @verb = verb
          end

          def passive_tense_methods
            [
              :passive_voice_indicative_mood_futureperfect_tense,
              :passive_voice_indicative_mood_future_tense,
              :passive_voice_indicative_mood_imperfect_tense,
              :passive_voice_indicative_mood_pastperfect_tense,
              :passive_voice_indicative_mood_perfect_tense,
              :passive_voice_indicative_mood_present_tense,
              :passive_voice_subjunctive_mood_imperfect_tense,
              :passive_voice_subjunctive_mood_pastperfect_tense,
              :passive_voice_subjunctive_mood_perfect_tense,
              :passive_voice_subjunctive_mood_present_tense
            ]
          end

          def active_tense_methods
            [
              :active_voice_imperative_mood_future_tense,
              :active_voice_imperative_mood_present_tense,
              :active_voice_indicative_mood_futureperfect_tense,
              :active_voice_indicative_mood_futureperfect_tense,
              :active_voice_indicative_mood_imperfect_tense,
              :active_voice_indicative_mood_pastperfect_tense,
              :active_voice_indicative_mood_perfect_tense,
              :active_voice_indicative_mood_present_tense,
              :active_voice_subjunctive_mood_imperfect_tense,
              :active_voice_subjunctive_mood_pastperfect_tense,
              :active_voice_subjunctive_mood_perfect_tense,
              :active_voice_subjunctive_mood_present_tense,
            ]
          end

          def defined_tense_methods
            active_tense_methods + passive_tense_methods
          end

          def active_voice_imperative_mood_future_tense
            f = imperatives.future
            TenseBlock.new(
              [ '', f[0], f[2], '', f[1], f[3] ],
              { :meaning => MEANINGS[:active_voice_imperative_mood_future_tense] }
            )
          end

          def active_voice_imperative_mood_present_tense
            imp = imperatives
            elements = [ '', imp.present_tense_singular_number, '', '', imp.present_tense_plural_number, '' ]
            meaning = { :meaning => MEANINGS[:active_voice_imperative_mood_present_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_indicative_mood_futureperfect_tense
            substem = first_person_perfect[0..-2]
            elements =  APERF_FUTURE_ENDINGS.flat_map{|x| substem + x}
            meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_futureperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_indicative_mood_futureperfect_tense
            substem = first_person_perfect[0..-2]
            TenseBlock.new(
              [APERF_FUTURE_ENDINGS.collect{|x| substem + x}].flatten,
              { :meaning => MEANINGS[:active_voice_indicative_mood_futureperfect_tense] }
            )
          end

          def active_voice_indicative_mood_imperfect_tense
            raise "Should be overridden in subclass of Querent"
          end

          def active_voice_indicative_mood_pastperfect_tense
            substem = first_person_perfect[0..-2]
            elements = APERF_PAST_ENDINGS.flat_map{|x| substem + x}
            meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_pastperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_indicative_mood_perfect_tense
            substem = first_person_perfect[0..-2]
            elements = APERF_ENDINGS.flat_map{|x| substem + x.to_s}
            elements.unshift first_person_perfect
            meaning = { :meaning => MEANINGS[:active_voice_indicative_mood_perfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_indicative_mood_present_tense
            raise "Should be overridden in subclass of Querent"
          end

          def active_voice_subjunctive_mood_imperfect_tense
            elements = [ 'm', *AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS ].flat_map do |ending|
              present_active_infinitive.sub(/e$/,'ē') + ending
            end
            meaning = { :meaning => MEANINGS[:active_voice_subjunctive_mood_imperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_subjunctive_mood_pastperfect_tense
            asp_base = first_person_perfect[0..first_person_perfect.length-2] + "issē"
            elements =  ['m', *AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flat_map do |ending|
              asp_base + ending
            end
            meaning = { :meaning => MEANINGS[:active_voice_subjunctive_mood_pastperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_subjunctive_mood_perfect_tense
            asp_base = first_person_perfect[0..first_person_perfect.length-2] + "erī"
            elements = ['m', *AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flat_map do |ending|
              asp_base + ending
            end
            meaning = { :meaning => MEANINGS[:active_voice_subjunctive_mood_perfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def active_voice_subjunctive_mood_present_tense
            raise "Should be overridden in subclass of Querent"
          end

          def passive_voice_indicative_mood_futureperfect_tense
            elements = PASS_PERF_FUTURE_ENDINGS.flat_map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}" }
            meaning = { :meaning => MEANINGS[:passive_voice_indicative_mood_futureperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def passive_voice_indicative_mood_future_tense
            raise "Should be overridden in subclass of Querent"
          end

          def passive_voice_indicative_mood_imperfect_tense
            raise "Should be overridden in subclass of Querent"
          end

          def passive_voice_indicative_mood_pastperfect_tense
            elements = Linguistics::Latin::Verb::PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  }
            meaning = { :meaning =>  Linguistics::Latin::Verb::MEANINGS[:passive_voice_indicative_mood_pastperfect_tense]}
            TenseBlock.new(elements, meaning)
          end

          def passive_voice_indicative_mood_perfect_tense
            elements = PASS_PERF_PRESENT_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  }
            meaning = { :meaning => MEANINGS[:passive_voice_indicative_mood_perfect_tense] }
            TenseBlock.new(elements, meaning )
          end

          def passive_voice_indicative_mood_present_tense
            raise "Should be overridden in subclass of Querent"
          end

          def passive_voice_subjunctive_mood_imperfect_tense
            base = present_active_infinitive.gsub(/(.*)(.)$/,"\\1" + 'ē')
            elements = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
              base + ending
            end
            meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_imperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def passive_voice_subjunctive_mood_pastperfect_tense
            count = -1
            elements = PASS_PLUPERF_PAST_ENDINGS.map do |ending|
              count += 1
              (count <= 2 ?
               "[ #{Formatters::TriplicateAndPluralizeFormatters.triplicate_and_genderize(passive_perfect_participle)} ]" :
               "[ #{Formatters::TriplicateAndPluralizeFormatters.pluralize_participial_listing(passive_perfect_participle)} ]" )+ " " + ending
            end
            meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_pastperfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def passive_voice_subjunctive_mood_perfect_tense
            counter = -1
            elements = PASS_PERF_SUBJUNCTIVE_ENDINGS.map do |ending|
              counter += 1
              (counter <= 2 ?
               "[ #{Formatters::TriplicateAndPluralizeFormatters.triplicate_and_genderize(passive_perfect_participle)} ]" :
               "[ #{Formatters::TriplicateAndPluralizeFormatters.pluralize_participial_listing(passive_perfect_participle)} ]" )+ " " + ending
            end
            meaning = { :meaning => Linguistics::Latin::Verb::MEANINGS[:passive_voice_subjunctive_mood_perfect_tense] }
            TenseBlock.new(elements, meaning)
          end

          def passive_voice_subjunctive_mood_present_tense
            raise "Should be overridden in subclass of Querent"
          end
        end
      end
    end
  end
end
