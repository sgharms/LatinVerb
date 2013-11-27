module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Semideponent
            extend Forwardable
            def_delegators :@verb, :original_string

            def initialize(verb, querent, opts={})
              @verb = verb
              @querent = querent
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
            end
            def mutate!;end

          end
        end
      end
    end
  end
end
