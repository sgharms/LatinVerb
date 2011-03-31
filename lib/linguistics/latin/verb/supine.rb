# encoding: UTF-8
#
module Linguistics 
  module Latin 
    module Verb 
      class LatinVerb
        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        # The supine is:
        #
        #   * 4th declension verbal noun
        #   * Formed on the same stem as the perfect passive participle
        #   * Only two forms in common use:  accusative and ablative singular 
        #
        # Ablative is used with the neuter of certain adjectives to indicate
        # what respect a particular quality is applicable: <em>mirabile
        # dictu</em>, <em>facile factu</em>.  The accusative is used with
        # verbs of motion to indicate purpose.
        #
        # -- Source <em>Wheelock</em>
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Hash with keys based on [:accusative] or [:ablative]
        #
        ###
        def supine
          acc = @pass_perf_part
          abl = acc.sub /^(.*)um$/, "\\1"
          abl += "ū"
          {:ablative => abl, :accusative => acc}
        end
      end
    end
  end
end
