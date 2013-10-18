module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class RegularVerbClassificationStrategy < VerbClassificationStrategy
            def self.classification
              Classification::Regular
            end

            def applicable?
              true
            end
          end
        end
      end
    end
  end
end
