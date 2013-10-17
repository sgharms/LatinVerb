require 'latinverb/components/present_only_checker'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          attr_reader :classification

          def initialize(input)
            @input = input
          end

          def classification
            return Classification::Defective if
              Linguistics::Latin::Verb::DEFECTIVE_VERBS.member? first_pres


            return Classification::Irregular if
              Linguistics::Latin::Verb::IRREGULAR_VERBS.member? first_pres

            return Classification::Semideponent if
              Linguistics::Latin::Verb::SEMI_DEPONENTS.keys.any?{ |k| first_pres=~/#{k}$/} &&
              @input !~ /PreventDeponentInfiniteRegress/

            return Classification::Impersonal if
              Linguistics::Latin::Verb::IMPERSONAL_VERBS.member?(@input)

            # Very irregular irregulars, A&G206, e/f
            return Classification::Irregular if
              @input =~ %r'^(aiō|quaesō|ovāre)$'

            return Classification::PresentOnly if PresentOnlyChecker.new(@input).present_only?

            return Classification::Deponent if
              (infinitive =~ /ī$/ && first_pres =~ /r$/)

            return Classification::Regular
          end

          def set_as_defective
            unless @classification == Linguistics::Latin::Verb::Classification::Impersonal
              @classification = Linguistics::Latin::Verb::Classification::PresentOnly
            end
          end

          def present_only?
            classification == Linguistics::Latin::Verb::Classification::PresentOnly
          end

          def deponent?
            classification == Linguistics::Latin::Verb::Classification::Deponent
          end

          def semideponent?
            classification == Linguistics::Latin::Verb::Classification::Semideponent
          end

          def impersonal?
            classification == Linguistics::Latin::Verb::Classification::Impersonal
          end

          def irregular?
            classification == Linguistics::Latin::Verb::Classification::Irregular
          end

          def regular?
            classification == Linguistics::Latin::Verb::Classification::Regular
          end

          def short_class
            classification.to_s.gsub(/.*::(\w+)$/,"\\1")
          end

          private

          def first_pres
            @input.split(/\s+/)[0]
          end

          def infinitive
            @input.split(/\s+/)[1]
          end

        end
      end
    end
  end
end
