module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImperativesFactory < AbstractClusterFactory

          def irregular
            Linguistics::Latin::Verb::LatinVerb::IrregularImperativesRetriever.new(@verb.original_string).retrieve
          end

          def deponent
            DeponentImperativesHandler.new(@verb)
          end

          def standard
            ImperativesHandler.new(@verb)
          end
        end
      end
    end
  end
end
