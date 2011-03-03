# encoding: UTF-8

require 'latinverb/latinverb_phonographia'
require 'yaml'

module Linguistics 
  module Latin 
    module Verb 
      class TenseBlock
        include  Linguistics::Latin::Phonographia
        def initialize(r)
          begin
            if r.class != Array
              puts "I have an unexpected #{r.class}"
              r = r.to_a
            end
            @results = r.map{|v| Linguistics::Latin::Phonographia.fix_macrons v}
          rescue => e
            raise "TenseBlock failed to initialize correctly.",  e
          end
        end
        def to_json(*a)
          {
            'json_class'   => self.class.name, 
            'data'         => @results
          }.to_json(*a)
        end
        def [](arg)
          @results[arg]
        end
        def to_a
          return @results
        end
        def first_person_singular_number;  return @results[0]; end
        def second_person_singular_number; return @results[1]; end
        def third_person_singular_number;  return @results[2]; end
        def first_person_plural_number;    return @results[3]; end
        def second_person_plural_number;   return @results[4]; end
        def third_person_plural_number;    return @results[5]; end
      end
      class LatinVerb

# Commands for immediate action.  Always second person.

        def active_voice_imperative_mood_present_tense
           imp = imperatives
           ["", imp[0], "", "", imp[1], ""]
        end

# Action to be completed in the future

        def active_voice_indicative_mood_future_tense
          return TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
              [AF_ONE_TWO_ENDINGS.collect{|x| stem + x}].flatten
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              [AF_OTHER_ENDINGS.collect{|x| stem + x}].flatten
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              [AF_OTHER_ENDINGS.collect{|x| stem + "i" + x}].flatten
            end)
        end

# Completed action in the future after now
# p. 77
        def active_voice_indicative_mood_futureperfect_tense
          substem = @first_pers_perf[0..-2]
          return TenseBlock.new [APERF_FUTURE_ENDINGS.collect{|x| substem+x}].flatten
        end

=begin rdoc

Imperfect: Habitual action in the past.  The base + %w(bam bas bat bamus batis
bant).

Wheelock Reference, p. 37.

=end
        def active_voice_indicative_mood_imperfect_tense
          return TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
              [AI_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              [AI_THIRD_CONJUG_PERS_ENDINGS.collect{|x| stem + x}].flatten
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              [AI_THIRD_CONJUG_PERS_ENDINGS.collect do |x| 
                stem + "i" + x end ].flatten!
            end)
        end

# Action completed in the past prior to an event in the past
# p. 77
        def active_voice_indicative_mood_pastperfect_tense
          substem = @first_pers_perf[0..-2]
           return TenseBlock.new [APERF_PAST_ENDINGS.collect{|x| substem+x}].flatten   
        end

# Action completed in the past
# p. 77


        def active_voice_indicative_mood_perfect_tense
          substem = @first_pers_perf[0..-2]
          return TenseBlock.new [@first_pers_perf.to_s, APERF_ENDINGS.collect{|x| substem+x.to_s}].flatten
        end

=begin rdoc

 The canonical building block of learning to conjugate verbs in Latin.  Take the present
 active infinitive, chop off the ending, and add the classic o,s,t,mus,tis,nt
 
 Wheelock Reference, p. 4.  

=end
        def active_voice_indicative_mood_present_tense
          return TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
                [ @first_pers_singular,
                      AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending}
               ].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              [ AP_THIRD_CONJUG_PERS_ENDINGS.collect{ |ending| stem + ending } ].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              [ @first_pers_singular,
                       AP_THIRDIO_CONJG_PERS_ENDINGS.collect{ |ending| stem + ending }
                     ].flatten!
            end)
        end

        def active_voice_subjunctive_mood_imperfect_tense
         TenseBlock.new(
           ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending| 
           @pres_act_inf + ending 
          end)
        end

        def active_voice_subjunctive_mood_pastperfect_tense
          asp_base = @first_pers_perf[0..@first_pers_perf.length-2] + "issē"
            TenseBlock.new( ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
              asp_base + ending
            end)
        end

        def active_voice_subjunctive_mood_perfect_tense
          asp_base = 
            @first_pers_perf[0..@first_pers_perf.length-2] +
            "erī"
          TenseBlock.new( 
            ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
            asp_base + ending
          end )
        end

        def active_voice_subjunctive_mood_present_tense
          key = lambda do
            conjugation.to_s.split(/::/).last.to_sym
          end

          TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
             asp_base = ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key.call].call(stem[0..-2])
             ['m',
                AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending| 
                  asp_base + ending 
                end
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
               asp_base = ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key.call].call(stem[0..-1])
               ['m',
                  AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending| 
                    asp_base + ending          
               end
            else
              base = 
               ['m',
                  AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do  |ending| 
              ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key.call].call(@stem) + ending
              end
            end    )
        end

        def passive_voice_indicative_mood_future_tense
          TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
                 fp_stem=stem+"bi"
                 standards = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[2..-1].map{|x| fp_stem + x}
                 standards.pop
                 fp_stem.sub!(/.$/,'u')
            [stem + "b\xc5\x8dr", 
             stem + "beris", standards, fp_stem+PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.last].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              fp_stem=stem+"ē"
              standards = PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| fp_stem + x}
              [stem + "ar", standards].flatten!      
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              ie_base=stem+"iē"
              [stem+"ia"+PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[0], 
                PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-1].map{|x| ie_base + x}].flatten!
            end)
        end

# Passive voice, present tense
# Wheelock, 122

        def passive_voice_indicative_mood_futureperfect_tense
          return TenseBlock.new(
            PASS_PERF_FUTURE_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end

# Passive voice, present tense
# Wheelock, 117

        def passive_voice_indicative_mood_imperfect_tense
          return TenseBlock.new (
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
              imperfect_stem = stem + "b\xc4\x81"
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| imperfect_stem+x}
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              ministem=stem + "ēbā"
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| ministem + x}
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              base=stem+"iēbā"
              [PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map{|x| base + x}].flatten!
            end)
        end

# Passive voice, present tense
# Wheelock, 117

        def passive_voice_indicative_mood_pastperfect_tense
          TenseBlock.new(
            PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end

# Passive voice, present tense
# Wheelock, 122

        def passive_voice_indicative_mood_perfect_tense
          TenseBlock.new(
             PASS_PERF_PRESENT_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end

# Passive voice, present tense
# Wheelock, 117

        def passive_voice_indicative_mood_present_tense
          return TenseBlock.new (
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
              local_pe=PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.clone
              [@first_pers_singular.to_s + "r", 
                local_pe[1..-1].map{|x| @stem + x}].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third
              [@first_pers_singular+"r", 
                PASSIVE_ENDINGS_OTHER[1..-1].map{|x| stem + x}].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO 
              base=stem+"i"
              [@first_pers_singular+"r", 
                PASSIVE_ENDINGS_OTHER[1..-2].map{|x| stem + x}, 
                base+PASSIVE_ENDINGS_OTHER[-1]].flatten!
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              base=@stem+"ī"
              [@first_pers_singular+"r", 
                PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG[1..-2].map{|x| base + x},
                base+PASSIVE_ENDINGS_OTHER[-1]].flatten!
            end)
        end

        def passive_voice_subjunctive_mood_imperfect_tense
          base = @pres_act_inf.gsub(/(.*)(.)$/,"\\1" + 'ē')
          TenseBlock.new( 
            PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending| 
            base + ending    
          end)
        end

        def passive_voice_subjunctive_mood_pastperfect_tense
          count = -1
          TenseBlock.new(PASS_PLUPERF_PAST_ENDINGS.map do |ending|
             count += 1
             (count <= 2 ?
               "[ #{triplicate_and_genderize @pass_perf_part} ]" :
               "[ #{pluralize_participial_listing(triplicate_and_genderize(@pass_perf_part))} ]" )+ " " + ending 
          end)      
        end

        def passive_voice_subjunctive_mood_perfect_tense
          counter = -1
          TenseBlock.new(PASS_PERF_SUBJ_ENDINGS.map do |ending|
             counter += 1
              (counter <=2 ? 
               "[ #{triplicate_and_genderize @pass_perf_part} ]" :
               "[ #{pluralize_participial_listing(triplicate_and_genderize(@pass_perf_part))} ]" )+ " " + ending 
            end)
        end

        def passive_voice_subjunctive_mood_present_tense
          key = lambda do
            conjugation.to_s.split(/::/).last.to_sym
          end
          TenseBlock.new(
            if conjugation == Linguistics::Latin::Verb::VerbTypes::First or 
               conjugation == Linguistics::Latin::Verb::VerbTypes::Second
              short_base = 
                ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS[key.call].call(stem[0..-2]) 
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending| 
                 short_base + ending
              end
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Third or
                  conjugation == Linguistics::Latin::Verb::VerbTypes::ThirdIO
             subjunctive_stem = conjugation.to_s =~ /O$/i ? stem + "iā" : stem + "ā"
             PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
               subjunctive_stem + ending
             end 
            elsif conjugation == Linguistics::Latin::Verb::VerbTypes::Fourth
              subjunctive_stem = stem + "iā"
              PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
                subjunctive_stem + ending
              end
            end)
        end

        def imperatives
          imperative_exceptions = { 
            "ducere"   => %w(duc ducite),
            "dicere"   => %w(dic dicite),
            "facere"   => %w(fac facite),
            "ferre"    => %w(fer ferte),
            "nolere"   => %w(nolo nolite)
          }   
              
          j = imperative_exceptions[@pres_act_inf].nil? ?
              nil :
              imperative_exceptions[@pres_act_inf]
                
          return j unless j.nil?
                   
          return_hash = 
          if @pres_act_inf =~ /āre$/
            [@stem, @stem+"te"]
          elsif @pres_act_inf =~ /ēre$/           
            [@stem, @stem+"te"]
          elsif @pres_act_inf =~ /ere$/
            [@stem+"e", @stem+"ite"]
          elsif @pres_act_inf =~ /īre$/
            [@stem+"ī", @stem+"īte"]
          end 
              
          return return_hash
        end

        private
        def pluralize_participial_listing(x)
          x.sub!(/us,/,   'ī,' )
          x.sub!(/a,/,    'ae,')
          x.sub!(/um.*$/, 'a'  )
        end       
        def triplicate_and_genderize(s)
          stem = s.sub(/^(.*)um$/,"\\1")
          [ stem + 'us',
            stem + 'a',
            s
          ].join(', ')
        end
      end
    end
  end
end

