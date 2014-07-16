module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImperativesFactory < AbstractClusterFactory

          def irregular
            IrregularImperativesHandler.new(@verb)
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
