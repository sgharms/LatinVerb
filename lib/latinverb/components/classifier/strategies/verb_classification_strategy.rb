module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class VerbClassificationStrategy
            def initialize(classifier)
              @classifier = classifier
            end

            protected

            def first_pres
              return "" unless input
              input.split(/\s+/)[0]
            end

            def infinitive
              return "" unless input
              input.split(/\s+/)[1]
            end

            def input
              @classifier.input || ''
            end
          end
        end
      end
    end
  end
end
