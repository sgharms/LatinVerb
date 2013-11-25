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
              end
            end
          end
        end
      end
    end
  end
end
