module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Deponent
            class InfinitiveMutator
              def initialize(verb)
                @verb =verb
                mutate!
              end

              def mutate!
              end
            end
          end
        end
      end
    end
  end
end
