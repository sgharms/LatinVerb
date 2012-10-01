# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2:

module Linguistics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      class LatinVerb
        ### {{{
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
        ### }}}
        class LatinVerbClassifier# {{{
          attr_reader :classification

          def initialize(input)
            @classification = self.classify input
          end

          def classify(s)

            divided_string = s.split( /\s+/ )

            first_pres = divided_string[0] || ''
            infinitive = divided_string[1] || ''

            return Linguistics::Latin::Verb::Classification::Defective if
              Linguistics::Latin::Verb::LatinVerb::DEFECTIVE_VERBS.member? first_pres

            return Linguistics::Latin::Verb::Classification::Irregular if
              Linguistics::Latin::Verb::LatinVerb::IRREGULAR_VERBS.member? first_pres

            return Linguistics::Latin::Verb::Classification::Semideponent if
              Linguistics::Latin::Verb::LatinVerb::SEMI_DEPONENTS.keys.any?{ |k| first_pres=~/#{k}$/} &&
              s !~ /PreventDeponentInfiniteRegress/

            return Linguistics::Latin::Verb::Classification::Impersonal if
              Linguistics::Latin::Verb::LatinVerb::IMPERSONAL_VERBS.member? s

            # Very irregular irregulars, A&G206, e/f
            return Linguistics::Latin::Verb::Classification::Irregular if
              s =~ %r'^(aiō|quaesō|ovāre)$'

            return Linguistics::Latin::Verb::Classification::Deponent if
              (infinitive =~ /ī$/  and first_pres =~ /r$/)

            return Linguistics::Latin::Verb::Classification::Regular

          end

          def set_as_defective
            unless @classification == Linguistics::Latin::Verb::Classification::Impersonal
              @classification = Linguistics::Latin::Verb::Classification::PresentOnly
            end
          end

          def present_only?
            @present_only ||= ( @classification ==  Linguistics::Latin::Verb::Classification::PresentOnly )
          end

          def deponent?
            @deponent ||= (@classification == Linguistics::Latin::Verb::Classification::Deponent)
          end

          def semideponent?
            @semideponent ||= (@classification == Linguistics::Latin::Verb::Classification::Semideponent)
          end

          def impersonal?
            @impersonal ||= (@classification == Linguistics::Latin::Verb::Classification::Impersonal)
          end

          def irregular?
            @irregular = @classification == Linguistics::Latin::Verb::Classification::Irregular
          end

          def regular?
            @regular = @classification == Linguistics::Latin::Verb::Classification::Regular
          end
        end# }}}
      end
    end
  end
end
