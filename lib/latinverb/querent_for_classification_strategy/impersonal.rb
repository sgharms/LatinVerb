module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
	    module NullActiveIndicativePresent
	      def active_voice_indicative_mood_present_tense
		return NullTenseBlock.new
	      end
	    end

            class Impersonal < Regular
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
