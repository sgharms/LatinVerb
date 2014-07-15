module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ParticiplesFactory < AbstractClusterFactory

          def irregular
            QuerentMutators::Irregular.new(@verb.original_string, @verb.passive_perfect_participle).participler
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


