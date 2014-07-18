module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class InfinitivesFactory < AbstractClusterFactory
          def irregular
            Linguistics::Latin::Verb::LatinVerb::IrregularInfinitivesRetriever.new(@verb.original_string).retrieve
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

