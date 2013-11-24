module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Other
              extend Forwardable
              def_delegators :@verb, :original_string, :passive_perfect_participle

              def initialize(verb)
                @verb = verb
              end

              def querent
                QuerentFactory.new(@verb).querent
              end
            end
          end
        end
      end
    end
  end
end
