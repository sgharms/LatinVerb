module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Irregular
              extend Forwardable
              def_delegators :@verb, :original_string, :passive_perfect_participle
              def_delegators :@builder, :querent

              attr_reader :builder

              def initialize(verb)
                @verb = verb
                @builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
              end
            end
          end
        end
      end
    end
  end
end
