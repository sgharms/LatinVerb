module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Irregular
              extend Forwardable
              def_delegators :@verb, :original_string, :passive_perfect_participle

              attr_reader :querent

              def initialize(verb)
                @verb = verb
                @builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle, @verb.original_string)
                @querent = @builder.querent
              end
            end
          end
        end
      end
    end
  end
end
