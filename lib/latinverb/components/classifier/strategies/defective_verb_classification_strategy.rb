module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class DefectiveVerbClassificationStrategy < VerbClassificationStrategy
            def self.classification
              Classification::Defective
            end

            def applicable?
              Linguistics::Latin::Verb::DEFECTIVE_VERBS.member? first_pres
            end
          end
        end
      end
    end
  end
end
