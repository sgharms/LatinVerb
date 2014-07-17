require_relative 'classifier/strategies/verb_classification_strategy'
require_relative 'classifier/strategies/defective_verb_classification_strategy'
require_relative 'classifier/strategies/irregular_verb_classification_strategy'
require_relative 'classifier/strategies/semideponent_verb_classification_strategy'
require_relative 'classifier/strategies/impersonal_verb_classification_strategy'
require_relative 'classifier/strategies/very_irregular_verb_classification_strategy'
require_relative 'classifier/strategies/deponent_verb_classification_strategy'
require_relative 'classifier/strategies/present_only_verb_classification_strategy'
require_relative 'classifier/strategies/regular_verb_classification_strategy'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          attr_reader :classification, :input

          def initialize(input, opts={})
            @input = input
            @strategies = opts[:strategies] || default_strategies
          end

          def classification
            applicable_strategy = @strategies.detect do |strategy|
              strategy.new(self).applicable?
            end
            applicable_strategy.classification
          end

          def present_only?
            classification == Linguistics::Latin::Verb::Classification::PresentOnly ||
              (classification == Linguistics::Latin::Verb::Classification::Irregular && VeryIrregularVerbClassificationStrategy.new(self).applicable?)
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

          def default_strategies
            [
              DefectiveVerbClassificationStrategy,
              IrregularVerbClassificationStrategy,
              SemideponentVerbClassificationStrategy,
              ImpersonalVerbClassificationStrategy,
              VeryIrregularVerbClassificationStrategy,
              PresentonlyVerbClassificationStrategy,
              DeponentVerbClassificationStrategy,
              RegularVerbClassificationStrategy
            ]
          end
        end
      end
    end
  end
end
