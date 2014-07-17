module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Impersonal < Regular
              def initialize(verb)
                @verb = verb
              end

              def querent
                ImpersonalQuerent.new(@verb).extend(ImpersonalVerbMixin)
              end
            end
          end
        end
      end
    end
  end
end
