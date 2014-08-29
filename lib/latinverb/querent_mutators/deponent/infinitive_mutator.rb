module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            class InfinitiveMutator
              def initialize(verb, querent, proxyVerb)
                @verb = verb
                @proxyVerb = proxyVerb
                @querent = querent

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
