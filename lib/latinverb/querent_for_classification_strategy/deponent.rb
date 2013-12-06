module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Deponent < Regular
              extend Forwardable
              def_delegators :@verb, :original_string

              def initialize(verb)
                super
                @proxyVerb = LatinVerb.new(proxy_string)
                QuerentMutators::Deponent.new(@verb, @querent).mutate!
              end

              def proxy_string
                DeponentStringDeriver.new(original_string).proxy_string
              end
            end
          end
        end
      end
    end
  end
end
