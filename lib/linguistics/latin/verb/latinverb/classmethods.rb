# encoding:  UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb

        # include Linguistics::Latin::Verb::Errors
        class << self

          ## 
          #
          # Deponent verbs can be conceived as being the <em>the passive</em> results of
          # a regular verb where the passive form's result is then applied to the active
          # vector specification.  Ergo the dictum "passive in form but active in
          # meaning."  As such, when we realize we have a deponent verb, we will create
          # its standard four principal part string sibling.  This, in turn, could be
          # used to create a LatinVerb.  Then through some method deletion or aliasing,
          # the active vector can be used to point to the (in fact) passive result
          #
          # For example:
          #
          # <pre>
          # j = LatinVerb.new conor conārī conatus
          # # create_pseudo_active_mask_for_deponent creates (conō, conāre, conāvī
          # conatus)
          # # Do magic so that active_voice_indicative_mood_present_tense points to
          # passive_voice_indicative_mood_present_tense
          # </pre>
          #
          # ===ARGUMENTS
          #
          # s :: A deponent description string to be pesudo-mapped
          #
          # ===RETURNS
          #
          # A pseudo-mapped, four principal-part string
          #
          ##
          def create_pseudo_active_mask_for_deponent(s)
            parts = s.split /\s+/

            # Turn the passive form into something that looks active
            parts[0].sub! /or$/, 'ō'

            # Turn the passive infinitive into something that looks active.
            # There's a subtle difference between:
            # 'vereor verērī veritum'
            # 'sequor sequī secūtus'
            #  Applying the first's rule to the second results in 'seque' not
            #  'sequere'.  Ergo the conditional.
            #
            parts[1].sub! /ī$/, 'e'

            # Fixes sequī -> sequere
            parts[1] += 're' unless parts[1] =~ /[āīē]re/

            # Set the 4th part to the value in the 3rd slot
            parts[3] = parts[2]
             
            # Another modification for third conjugation deponents
            parts[3].sub! /us$/, 'um'

            # This value shouldn't be used...(I don't think...)
            parts[2] = "JUNK" # 

            parts.join(' ')
          end
          ##
          # 
          # == ARGUMENTS
          # 
          #    * s :: a "four principal parts" string whence can be derived
          #  the first person singular present indicative as well as the
          #  infinitive
          # 
          # == RETURNS      
          # 
          # The classification, a subclass of VerbType
          # 
          # == PURPOSE      
          # 
          # Given the principal parts as a string, decide which conjuation is
          # in play
          # 
          # 
          ##
          def classify(s)

            if s.class == String
              divided_string = s.split /\s+/

              first_pres = divided_string[0]
              infinitive = divided_string[1]

              return Linguistics::Latin::Verb::VerbTypes::Defective if
                Linguistics::Latin::Verb::LatinVerb::DEFECTIVE_VERBS.member? first_pres

              return Linguistics::Latin::Verb::VerbTypes::Irregular if
                Linguistics::Latin::Verb::LatinVerb::IRREGULAR_VERBS.member? first_pres

              return Linguistics::Latin::Verb::VerbTypes::Semideponent if
                ( Linguistics::Latin::Verb::LatinVerb::SEMI_DEPONENTS.keys.any?{ |k| first_pres=~/#{k}$/} and
                  s !~ /JUNK/ )  

              if    infinitive =~ /āre$/
                return Linguistics::Latin::Verb::VerbTypes::First
              elsif infinitive =~ /ēre$/
                return Linguistics::Latin::Verb::VerbTypes::Second
              elsif infinitive =~ /ere$/
                 if first_pres =~ /i.$/
                   return Linguistics::Latin::Verb::VerbTypes::ThirdIO
                 else
                   return Linguistics::Latin::Verb::VerbTypes::Third
                 end
              elsif infinitive =~ /.+īre$/
                return Linguistics::Latin::Verb::VerbTypes::Fourth
              elsif (infinitive =~ /ī$/  and first_pres =~ /r$/)
                return Linguistics::Latin::Verb::VerbTypes::Deponent
              else
                raise RuntimeError "Could not find a verb type for this verb #{infinitive} and #{first_pres}"
              end
            end
          end

          ##
          # 
          # == ARGUMENTS
          # 
          #    * pres_act_inf
          # 
          # == RETURNS      
          # 
          # The “stem” of a Latin Verb
          # 
          # == PURPOSE      
          # 
          # Based on the present active infinitive, identify the “stem” and set the +@stem+
          # iVar.  The method also returns the stem value.
          # 
          ##
          def calculate_stem(pres_act_inf)
            # TODO: For efficiency, if the iVar @stem is defined, don't go through this structure?
            if pres_act_inf =~ /āre$/
              return pres_act_inf.gsub(/(.*)āre$/,'\\1ā')
            end
            if pres_act_inf =~ /ēre$/
              return pres_act_inf.gsub(/(.*)ēre$/,'\\1ē')
            end
            if pres_act_inf =~ /ere$/
              if @first_pers_singular =~ /iō$/
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              else
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              end
            end
            if pres_act_inf =~ /īre$/
              return pres_act_inf.gsub(/(.*)īre$/,'\\1')
            end
          end

          ##
          # 
          # == ARGUMENTS
          # 
          #     * first_person_singular
          #     * pres_act_inf
          # 
          # == RETURNS      
          # 
          # The participial “stem” of a Latin Verb, used for participle
          # formation
          # 
          # == PURPOSE      
          # 
          # Calculate the participial stem, used in forming participles.
          # 
          ##
          def calculate_participial_stem(first_pers_singular, pres_act_inf)
             raise("pres_act_inf was nil![#{first_pers_singular} and #{pres_act_inf}]") if
               pres_act_inf.empty? or first_pers_singular.empty?

             if pres_act_inf.to_s =~ /(.*ā)re$/
              return $1
            end

            if pres_act_inf.to_s =~ /(.*ē)re$/
              return $1
            end

            if pres_act_inf.to_s =~ /(.*)ere$/
              match=$1
              if first_pers_singular =~ /iō/
                return match + "iē"
              else
                return match + "e"
              end
            end

            if pres_act_inf.to_s =~ /(.*)īre$/
              return $1 + "iē"
            end
          end

        end
      end
    end
  end
end

