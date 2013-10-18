module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class SemideponentVerbClassificationStrategy < VerbClassificationStrategy
            def self.classification
              Classification::Semideponent
            end

            def applicable?
              Linguistics::Latin::Verb::SEMI_DEPONENTS.keys.any?{ |k| first_pres=~/#{k}$/} && input !~ /PreventDeponentInfiniteRegress/
            end
          end
        end
      end
    end
  end
end
