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
                return QuerentMutators::Deponent.new(@verb, @querent).mutate!
              end
            end
          end
        end
      end
    end
  end
end
