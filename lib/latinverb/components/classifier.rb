module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          extend Forwardable

          attr_reader :classification, :input
          def_delegators :@verb, :is_proxy_verb?

          def initialize(verb, opts={})
            @verb = verb
            @input = verb.original_string
            @strategies = opts[:strategies] || default_strategies
          end

          def classification
            @strategies.detect { |s| s.new(self).applicable? }.classification
          end

          def proxy_verb?
            !!@verb.options[:proxy_verb]
          end

          def present_only?
            classification == Linguistics::Latin::Verb::Classification::PresentOnly ||
              extremely_irregular?
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

          def extremely_irregular?
            classification == Linguistics::Latin::Verb::Classification::Irregular &&
              VeryIrregularVerbClassificationStrategy.new(self).applicable?
          end
        end
      end
    end
  end
end
