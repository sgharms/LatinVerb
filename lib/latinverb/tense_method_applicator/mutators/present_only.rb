module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class PresentOnly
            def initialize(verb)
              @verb = verb
            end

            def mutate!
            end
          end
        end
      end
    end
  end
end
