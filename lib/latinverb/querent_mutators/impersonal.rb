module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Impersonal
            extend Forwardable
            def_delegators :@verb, :original_string, :querent

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
