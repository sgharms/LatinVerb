# encoding:  UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb

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
            parts = s.split( /\s+/ )

            # Turn the passive form into something that looks active
            parts[0].sub!( /or$/, 'ō' )

            # Turn the passive infinitive into something that looks active.
            # There's a subtle difference between:
            # 'vereor verērī veritum'
            # 'sequor sequī secūtus'
            #  Applying the first's rule to the second results in 'seque' not
            #  'sequere'.  Ergo the conditional.
            #
            parts[1].sub!( /ī$/, 'e' )

            # Fixes sequī -> sequere
            parts[1] += 're' unless parts[1] =~ /[āīē]re/

            # Set the 4th part to the value in the 3rd slot
            parts[3] = parts[2]

            # Another modification for third conjugation deponents
            parts[3].sub!( /us$/, 'um' )

            # This value shouldn't be used
            parts[2] = "PreventDeponentInfiniteRegress"

            parts.join(' ')
          end

          ##
          #
          # == ARGUMENTS
          #
          #    * present_active_infinitive
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

          ##
          #
          # == ARGUMENTS
          #
          #     * first_person_singular
          #     * present_active_infinitive
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
          def calculate_participial_stem(first_person_singular, present_active_infinitive)
             raise("present_active_infinitive was nil![#{first_person_singular} and #{present_active_infinitive}]") if
               present_active_infinitive.empty? or first_person_singular.empty?

             if present_active_infinitive.to_s =~ /(.*ā)re$/
              return $1
            end

            if present_active_infinitive.to_s =~ /(.*ē)re$/
              return $1
            end

            if present_active_infinitive.to_s =~ /(.*)ere$/
              match=$1
              if first_person_singular =~ /iō/
                return match + "iē"
              else
                return match + "e"
              end
            end

            if present_active_infinitive.to_s =~ /(.*)īre$/
              return $1 + "iē"
            end
          end

        end
      end
    end
  end
end

