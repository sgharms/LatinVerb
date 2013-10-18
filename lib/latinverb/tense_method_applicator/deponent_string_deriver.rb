module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentStringDeriver
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

          attr_reader :proxy_string

          def initialize(s)
            @original_string = s
            @proxy_string = create_pseudo_active_mask_for_deponent
          end

          private

          def create_pseudo_active_mask_for_deponent
            parts = @original_string.split( /\s+/ )

            # Turn the passive form into something that looks active
            parts[0].sub!( /or$/, 'ō' )

            # Turn the passive infinitive into something that looks active.
            # There's a subtle difference between:
            # 'vereor verērī veritum'
            # 'sequor sequī secūtus'
            #  Applying the first's rule to the second results in 'seque' not
            #  'sequere'.  Ergo the conditional.
            #
            parts[1] ||= ""
            parts[1].sub!( /ī$/, 'e' )

            # Fixes sequī -> sequere
            parts[1] += 're' unless parts[1] =~ /[āīē]re/

            # Set the 4th part to the value in the 3rd slot
            parts[3] = parts[2]

            # Another modification for third conjugation deponents
            parts[3] ||= ""
            parts[3].sub!( /us$/, 'um' )

            # This value shouldn't be used
            parts[2] = "PreventDeponentInfiniteRegress"

            parts.join(' ')
          end
        end
      end
    end
  end
end
