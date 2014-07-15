module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class InfinitivesFactory < AbstractClusterFactory

          def irregular
            QuerentMutators::Irregular.new(@verb.original_string, @verb.passive_perfect_participle).infinitivizer
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

