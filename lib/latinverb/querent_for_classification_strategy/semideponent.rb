
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Semideponent < Regular
              def post_initialize
                override_default_querent!
              end

              private

              def override_default_querent!
                @querent = SemideponentQuerentAdapter.new(@verb, @querent)
              end
            end
          end
        end
      end
    end
  end
end
