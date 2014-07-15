module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImperativesFactory < AbstractClusterFactory

          def irregular
            QuerentMutators::Irregular.new(@verb.original_string, @verb.passive_perfect_participle).imperative_handler
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
