module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class ImpersonalVerbClassificationStrategy < VerbClassificationStrategy
            def self.classification
              Classification::Impersonal
            end

            def applicable?
              Linguistics::Latin::Verb::IMPERSONAL_VERBS.member?(input)
            end
          end
        end
      end
    end
  end
end
