module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class PresentonlyVerbClassificationStrategy < VerbClassificationStrategy
            def self.classification
              Classification::PresentOnly
            end

            def applicable?
              PresentOnlyChecker.new(input).present_only?
            end
          end
        end
      end
    end
  end
end
