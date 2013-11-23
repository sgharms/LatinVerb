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
                @builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
                @querent = calculate_querent!
              end

              def calculate_querent!
                unvectorized_querent = @builder.querent
                QuerentTenseMethodsVectorizer.new(unvectorized_querent).add_vector_methods!
                unvectorized_querent
              end
            end
          end
        end
      end
    end
  end
end
