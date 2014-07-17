module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Regular
              extend Forwardable
              def_delegators :@querent, :defined_tense_methods

              attr_reader :querent

              def initialize(verb)
                @verb = verb
                @querent = QuerentFactory.new(@verb).querent

                post_initialize
              end

              private

              def post_initialize
              end
            end
          end
        end
      end
    end
  end
end
