module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ParticiplesFactory < AbstractClusterFactory

          def irregular
            Linguistics::Latin::Verb::LatinVerb::IrregularParticiplesRetriever.new(@verb.original_string).retrieve
          end

          def deponent
            DeponentParticipler.new(@verb)
          end

          def standard
            Participler.new(@verb)
          end
        end
      end
    end
  end
end
