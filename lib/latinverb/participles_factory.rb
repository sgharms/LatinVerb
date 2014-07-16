module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ParticiplesFactory < AbstractClusterFactory

          def irregular
            IrregularParticiplesHandler.new(@verb)
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
