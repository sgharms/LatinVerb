module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Regular
              extend Forwardable
              def_delegators :@verb, :original_string, :passive_perfect_participle

              attr_reader :querent

              def initialize(verb)
                @verb = verb
                @querent = QuerentFactory.new(@verb).querent

                post_initialize
                add_number_and_person_methods_to_tense_block_on_querent!
              end

              private

              def add_number_and_person_methods_to_tense_block_on_querent!
                QuerentTenseMethodsVectorizer.new(@querent).add_vector_methods!
              end

              def post_initialize
              end
            end
          end
        end
      end
    end
  end
end
