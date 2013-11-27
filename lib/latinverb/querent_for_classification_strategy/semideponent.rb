
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Semideponent < Regular
              def post_initialize
                @querent = SemideponentQuerentAdapter.new(@verb, @querent)
              end
            end
          end
        end
      end
    end
  end
end
