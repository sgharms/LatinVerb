# encoding: UTF-8

require 'linguistics/latin/verb/phonographia'
require 'linguistics/latin/verb/latinverb/auxiliary_classes'
require 'yaml'

module Linguistics 
  module Latin 
    module Verb 
    ##
    # == NAME
    #
    # TenseBlock
    #
    # == DESCRIPTION
    #
    # As per the LatinVerb documentation, LatinVerbs decorate themselves with
    # the method which loads up a voice/tense/mood black box.  That black box
    # is a TenseBlock.  The TenseBlock, in turn, responds to getting the final
    # two components of the fully-qualified vector back (person and number).
    # It also has Array-like behaviors (e.g. +[]+) based on the 2 * 3 matrix.
    #
    # == INTERNALS
    #
    # Internally, a Tenseblock is effectively an Array of the arguments passed
    # in during TenseBlock.initialize.  These are assumed to be
    # first/singular, second/singular, third/singular and then
    # first/plural, second/plural, third/plural.
    #
    # Syntactic sugar methods are added to access this array.  Thus, in a
    # LatinVerb a fully-qualified vectors first 3/5 data resolve to a
    # TenseBlock.  The last 2/5 of resolution occurs within the TenseBlock
    # (effectively pulling the contents of the Array).  Therefore, when a
    # LatinVerb is accessed with the quinpartite fully-qualified vector it can
    # return the unique value.  The mechanics of this hook through (surprise!)
    # method_missing.
    #
    #
    ##

      class TenseBlock
        include  Linguistics::Latin::Phonographia

        # === ARGUMENTS
        #
        # *r:* :: An Array (or something that can respond to to_a) containing 0-6
        #         elements that will be mapped into the 2*3 matrix of Latin verb person /
        #         number specifications.
        # === RETURNS
        #
        #  Nothing
        ##
        def initialize(r)
          begin
            if r.class != Array
              raise if r.nil?
              r = r.to_a
            end
            @results = r.map{|v| Linguistics::Latin::Phonographia.fix_macrons v}
          rescue => e
            raise e, "TenseBlock failed to initialize correctly. passed #{r.nil?}"
          end
        end

        ##
        #
        # Required for serialization
        #
        ##
        def to_json(*a)
          {
            'json_class'   => self.class.name, 
            'data'         => @results.map{|i| i.to_json}
          }.to_json(*a)
        end

        ##
        #
        # Required for deserialization
        #
        ##
        def TenseBlock.json_create(o)
         new(o['data']) 
        end

        ##
        #
        # Provides Array-like interface to the collection of results.
        #
        ##
        def [](arg)
          @results[arg]
        end

        ##
        #
        # To Array, useful in serialization
        #
        ##
        def to_a
          return @results
        end

        ##
        #
        # Add array compatibility support
        #
        ##
        def length; return @results.length; end

        ##
        # Add array empty? compatibility
        #
        ##
        def empty?; return @results.empty?; end

##
#--
# TODO:  I dream of this being generated dynamically through the
# VerbvectorGenerator for more dynamicity.  This would require a richer DSL in
# VerbvectorGenerator, but would be totally awesome if we could describe this
# language in a DSL. 
#++
##
 
        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def first_person_singular_number;  return @results[0]; end

        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def second_person_singular_number; return @results[1]; end

        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def third_person_singular_number;  return @results[2]; end

        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def first_person_plural_number;    return @results[3]; end

        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def second_person_plural_number;   return @results[4]; end

        # Syntactic sugar for accessing the final coordinates in the TenseBlock
        def third_person_plural_number;    return @results[5]; end
      end

      class LatinVerb


        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Commands for immediate action.  Always second person.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_imperative_mood_present_tense
          imp = imperatives
          TenseBlock.new( [ '', imp.present_tense_singular_number, '', 
                                   '', imp.present_tense_plural_number, ''
                          ] 
                        )
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Commands for immediate action.  Only supports second or third
        # person.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_imperative_mood_future_tense
          f = imperatives.future
          return TenseBlock.new( [ '', f[0], f[2], 
                                   '', f[1], f[3]
                                 ] 
                               )
        end
        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Action to be completed in the future.  A&G,160,a,3.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Action completed in the future.  
        # A&G,160,b,3.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_indicative_mood_futureperfect_tense
          substem = @first_pers_perf[0..-2]
          return TenseBlock.new [APERF_FUTURE_ENDINGS.collect{|x| substem+x}].flatten
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Habitual action in the past.  A&G,160,a,2.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Action completed in the past prior to an event in the past.
        # A&G,160,b,3.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_indicative_mood_pastperfect_tense
          substem = @first_pers_perf[0..-2]
           return TenseBlock.new [APERF_PAST_ENDINGS.collect{|x| substem+x}].flatten   
        end



        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Action completed in the past.  A&G,160,b,1.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_indicative_mood_perfect_tense
          substem = @first_pers_perf[0..-2]
          return TenseBlock.new [@first_pers_perf.to_s, APERF_ENDINGS.collect{|x| substem+x.to_s}].flatten
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # The canonical building block of learning to conjugate verbs in
        # Latin.  Take the present active infinitive, chop off the ending, and
        # add the classic o,s,t,mus,tis,nt
        # 
        # Wheelock Reference, p. 4.  
        # A&G, 160,a,1.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_subjunctive_mood_imperfect_tense
         TenseBlock.new(
           ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending| 
           @pres_act_inf + ending 
          end)
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_subjunctive_mood_pastperfect_tense
          asp_base = @first_pers_perf[0..@first_pers_perf.length-2] + "issē"
            TenseBlock.new( ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
              asp_base + ending
            end)
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def active_voice_subjunctive_mood_perfect_tense
          asp_base = 
            @first_pers_perf[0..@first_pers_perf.length-2] +
            "erī"
          TenseBlock.new( 
            ['m', AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
            asp_base + ending
          end )
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Voice" section in reference, for function consult
        # active-voice counterpart.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Voice" section in reference, for function consult
        # active-voice counterpart.</em>
        # Wheelock, 122
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_indicative_mood_futureperfect_tense
          return TenseBlock.new(
            PASS_PERF_FUTURE_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end


        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Voice" section in reference, for function consult
        # active-voice counterpart.</em>
        # Wheelock, 117
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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


        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Voice" section in reference, for function consult
        # active-voice counterpart.</em>
        # Wheelock, 117
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_indicative_mood_pastperfect_tense
          TenseBlock.new(
            PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end


        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Wheelock, 122
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_indicative_mood_perfect_tense
          TenseBlock.new(
             PASS_PERF_PRESENT_ENDINGS.map{ |helping_verb| "#{@pass_perf_part} #{helping_verb}"  })
        end


        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Voice" section in reference, for function consult
        # active-voice counterpart.</em>
        # Wheelock, 117
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_subjunctive_mood_imperfect_tense
          base = @pres_act_inf.gsub(/(.*)(.)$/,"\\1" + 'ē')
          TenseBlock.new( 
            PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending| 
            base + ending    
          end)
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_subjunctive_mood_pastperfect_tense
          count = -1
          TenseBlock.new(PASS_PLUPERF_PAST_ENDINGS.map do |ending|
             count += 1
             (count <= 2 ?
               "[ #{triplicate_and_genderize @pass_perf_part} ]" :
               "[ #{pluralize_participial_listing(triplicate_and_genderize(@pass_perf_part))} ]" )+ " " + ending 
          end)      
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def passive_voice_subjunctive_mood_perfect_tense
          counter = -1
          TenseBlock.new(PASS_PERF_SUBJ_ENDINGS.map do |ending|
             counter += 1
              (counter <=2 ? 
               "[ #{triplicate_and_genderize @pass_perf_part} ]" :
               "[ #{pluralize_participial_listing(triplicate_and_genderize(@pass_perf_part))} ]" )+ " " + ending 
            end)
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # <em>Refer to "Moods," above.  Tense is constrained by function of
        # the verb in context.</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
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

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # Used to express command.  As A&G notes, oftentimes the Subjunctive
        # is the correct mood for exhortation.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # TenseBlock
        #
        ###
        def imperatives
          @imperatives ||= form_imperatives
        end

        private

        def form_imperatives

          imperative_exceptions = { 
            "ducere"   => %w(duc ducite),
            "dicere"   => %w(dic dicite),
            "facere"   => %w(fac facite),
            "ferre"    => %w(fer ferte),
            "nolere"   => %w(nolo nolite)
          }   

          # Exceptional imperatives.  If we have one, return it straight away.
          if imperative_exceptions.has_key?(@pres_act_inf)
            return Linguistics::Latin::Verb::ImperativeBlock.new(
              imperative_exceptions[@pres_act_inf])
          end
              
          # Therefore, let us assume that we are dealing with a standard verb
          # with standard imperatives.  Accordingly, we will create an
          # ImperativeBlock.
              
          return Linguistics::Latin::Verb::ImperativeBlock.new @stem, @pres_act_inf
        end

        ##
        #
        # === DESCRIPTION
        #
        # Used for handling verb states that are compounds like _amatus,
        # amata, amatum sum_ and converting them to amati, amatae, amata,
        # (sumus|estis|sunt).
        # 
        # === ARGUMENTS
        #
        # +x:+ :: A string that looks like --us, --a, --um
        #         This method mutates those singular endings to plural forms
        #
        # === RETURNS
        #
        # Altered string
        #
        # === EXAMPLE
        #
        # pluralize_participial_listing(qq/amatus, amata, amatum/) #=>
        #   amatī, amatae, amata
        #
        ## 
        def pluralize_participial_listing(x)
          x.sub!(/us,/,   'ī,' )
          x.sub!(/a,/,    'ae,')
          x.sub!(/um.*$/, 'a'  )
        end       

        ##
        #
        # === DESCRIPTION
        #
        # Used for turning a participial form --um into --us, --a, --um
        #  
        # === ARGUMENTS
        #
        # +s:+ :: --um
        #
        # === RETURNS
        #
        # Altered string
        #
        # === EXAMPLE
        #
        # triplicate_and_genderize("amatum") #=> amatus, amata, amatum
        #
        ## 
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

