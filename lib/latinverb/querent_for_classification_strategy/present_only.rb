module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class PresentOnly < Regular
              def initialize(verb)
                super
                mutate_defectives_on_querent!
              end

              private

              def mutate_defectives_on_querent!
                QuerentPerfectTenseRemover.new(@querent).remove! if DefectiveChecker.new(@verb).defective?
              end
            end
          end
        end
      end
    end
  end
end
