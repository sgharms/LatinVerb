module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class PresentOnly < Regular
              private

              def post_initialize
                eclipse_past_and_pastperfect_tenses!
              end

              def eclipse_past_and_pastperfect_tenses!
		@querent.extend(PerfectAndPastperfectTenseBlockEclipser)
              end
            end
          end
        end
      end
    end
  end
end
