module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Semideponent < Regular
              extend Forwardable
              def initialize(verb)
                super
                QuerentMutators::Semideponent.new(@verb, @querent).mutate!
              end
            end
          end
        end
      end
    end
  end
end
