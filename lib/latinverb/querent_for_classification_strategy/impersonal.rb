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
                @querent ||= QuerentTenseMethodsVectorizer.new(unvectorized_querent).add_vector_methods!
                @querent.extend(ImpersonalVerbMixin)
              end

              private

              def unvectorized_querent
                ImpersonalQuerent.new(@verb)
              end
            end
          end
        end
      end
    end
  end
end
