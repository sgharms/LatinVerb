module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class InfinitivesFactory < AbstractClusterFactory
          def irregular
            IrregularInfinitivesHandler.new(@verb)
          end

          def deponent
            DeponentInfinitivizer.new(@verb)
          end

          def standard
            Infinitivizer.new(@verb)
          end
        end
      end
    end
  end
end

