module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbClassifier
          class SemideponentVerbClassificationStrategy < VerbClassificationStrategy
            extend Forwardable
            def_delegators :@classifier, :is_not_a_proxy_verb?

            def self.classification
              Classification::Semideponent
            end

            def applicable?
              first_pres_matches_semi_deponent_list? && !@classifier.proxy_verb?
            end

            private

            def first_pres_matches_semi_deponent_list?
              Linguistics::Latin::Verb::SEMI_DEPONENTS.keys.any? do |semi_dep_member|
                first_pres=~/#{semi_dep_member}$/
              end
            end
          end
        end
      end
    end
  end
end
