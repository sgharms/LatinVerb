module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class PresentOnly
            def initialize(querent)
              @verb = querent
            end
            def mutate!
            end
          end
        end
      end
    end
  end
end
