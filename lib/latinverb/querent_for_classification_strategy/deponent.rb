module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Deponent < Regular
              extend Forwardable
              def initialize(verb)
                super
                @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
                QuerentMutators::Deponent.new(@verb, @querent).mutate!
              end
            end
          end
        end
      end
    end
  end
end
