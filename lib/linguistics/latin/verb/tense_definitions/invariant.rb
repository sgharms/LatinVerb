# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2:

module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        ##
        #
        # Tense-forming methods that do not vary between the verb types
        #
        ##
        module Invariant
          IMPERATIVE_EXCEPTIONS = {
            "ducere"   => %w(duc ducite),
            "dicere"   => %w(dic dicite),
            "facere"   => %w(fac facite),
            "ferre"    => %w(fer ferte),
            "nolere"   => %w(nolo nolite)
          }
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
                            ],
                            { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_imperative_mood_present_tense] }
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
          def active_voice_imperative_mood_future_tense# {{{
            f = imperatives.future
            return TenseBlock.new( [ '', f[0], f[2],
                                     '', f[1], f[3]
                                   ],
                                  { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_imperative_mood_future_tense] }
                                 )
          end# }}}

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
          def active_voice_indicative_mood_futureperfect_tense# {{{
            substem = first_person_perfect[0..-2]
            return TenseBlock.new [Linguistics::Latin::Verb::LatinVerb::APERF_FUTURE_ENDINGS.collect{|x| substem+x}].flatten,
                   { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_futureperfect_tense] }
          end# }}}

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
          def active_voice_indicative_mood_pastperfect_tense# {{{
            substem = first_person_perfect[0..-2]
             return TenseBlock.new [Linguistics::Latin::Verb::LatinVerb::APERF_PAST_ENDINGS.collect{|x| substem+x}].flatten,
                    { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_pastperfect_tense] }
          end# }}}

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
             ['m', Linguistics::Latin::Verb::LatinVerb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
             present_active_infinitive.sub(/e$/,'ē') + ending
            end,
            { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_subjunctive_mood_imperfect_tense] }
            )
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
          def active_voice_indicative_mood_perfect_tense# {{{
            substem = first_person_perfect[0..-2]
            return TenseBlock.new [first_person_perfect.to_s, Linguistics::Latin::Verb::LatinVerb::APERF_ENDINGS.collect{|x| substem+x.to_s}].flatten,
                   { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_indicative_mood_perfect_tense] }
          end# }}}

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
          def active_voice_subjunctive_mood_pastperfect_tense# {{{
            asp_base = first_person_perfect[0..first_person_perfect.length-2] + "issē"
              TenseBlock.new( ['m', Linguistics::Latin::Verb::LatinVerb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
                asp_base + ending
              end,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_subjunctive_mood_pastperfect_tense] }
              )
          end# }}}

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
              first_person_perfect[0..first_person_perfect.length-2] +
              "erī"
            TenseBlock.new(
              ['m', Linguistics::Latin::Verb::LatinVerb::AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS].flatten!.map do |ending|
              asp_base + ending
            end,
            { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:active_voice_subjunctive_mood_perfect_tense] }
            )
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
          def passive_voice_indicative_mood_futureperfect_tense# {{{
            return TenseBlock.new(
              Linguistics::Latin::Verb::LatinVerb::PASS_PERF_FUTURE_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  },
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_futureperfect_tense] }
              )
          end# }}}

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
          def passive_voice_indicative_mood_pastperfect_tense# {{{
            TenseBlock.new(
              Linguistics::Latin::Verb::LatinVerb::PASS_PERF_PAST_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  },
              { :meaning =>  Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_pastperfect_tense]}
              )
          end# }}}

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
               Linguistics::Latin::Verb::LatinVerb::PASS_PERF_PRESENT_ENDINGS.map{ |helping_verb| "#{passive_perfect_participle} #{helping_verb}"  },
               { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_indicative_mood_perfect_tense] }
               )
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
            base = present_active_infinitive.gsub(/(.*)(.)$/,"\\1" + 'ē')
            TenseBlock.new(
              Linguistics::Latin::Verb::LatinVerb::PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG.map do |ending|
              base + ending
            end,
            { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_subjunctive_mood_imperfect_tense] }
            )
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
          def passive_voice_subjunctive_mood_pastperfect_tense# {{{
            count = -1
            TenseBlock.new(Linguistics::Latin::Verb::LatinVerb::PASS_PLUPERF_PAST_ENDINGS.map do |ending|
               count += 1
               (count <= 2 ?
                 "[ #{triplicate_and_genderize passive_perfect_participle} ]" :
                 "[ #{pluralize_participial_listing(triplicate_and_genderize(passive_perfect_participle))} ]" )+ " " + ending
            end,
            { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_subjunctive_mood_pastperfect_tense] }
            )
          end# }}}

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
            TenseBlock.new(Linguistics::Latin::Verb::LatinVerb::PASS_PERF_SUBJUNCTIVE_ENDINGS.map do |ending|
               counter += 1
                (counter <=2 ?
                 "[ #{triplicate_and_genderize passive_perfect_participle} ]" :
                 "[ #{pluralize_participial_listing(triplicate_and_genderize(passive_perfect_participle))} ]" )+ " " + ending
              end,
              { :meaning => Linguistics::Latin::Verb::LatinVerb::MEANINGS[:passive_voice_subjunctive_mood_perfect_tense] }
              )
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

          def form_imperatives# {{{
            args = exceptional_imperative? ? calculate_exceptional_imperatives : [stem, present_active_infinitive]
            Linguistics::Latin::Verb::ImperativeBlock.new(*args, self)
          end# }}}

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
          def triplicate_and_genderize(s)# {{{
            stem = s.sub(/^(.*)um$/,"\\1")
            [ stem + 'us',
              stem + 'a',
              s
            ].join(', ')
          end# }}}

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
          #
          # === RETURNS
          #
          # TenseBlock
          #
          ###
          def passive_voice_indicative_mood_present_tense
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
          end

          private

          def exceptional_imperative?
            IMPERATIVE_EXCEPTIONS.has_key?(present_active_infinitive)
          end

          def calculate_exceptional_imperatives
            IMPERATIVE_EXCEPTIONS[present_active_infinitive]
          end

        end
      end
    end
  end
end
