module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentPerfectTenseRemover
	  TENSE_BLOCKS_TO_ECLIPSE = [
	    :active_voice_indicative_mood_futureperfect_tense,
	    :active_voice_indicative_mood_pastperfect_tense,
	    :active_voice_indicative_mood_perfect_tense,
	    :active_voice_subjunctive_mood_pastperfect_tense,
	    :active_voice_subjunctive_mood_perfect_tense,
	    :passive_voice_indicative_mood_futureperfect_tense,
	    :passive_voice_indicative_mood_pastperfect_tense,
	    :passive_voice_indicative_mood_perfect_tense,
	    :passive_voice_subjunctive_mood_pastperfect_tense,
	    :passive_voice_subjunctive_mood_perfect_tense
	  ]

          def initialize(perfect_tense_block_bearer)
            @perfect_tense_block_bearer = perfect_tense_block_bearer
          end

          def remove!
            TENSE_BLOCKS_TO_ECLIPSE.each do |s|
              @perfect_tense_block_bearer.singleton_class.class_eval do
                define_method s do
                  return NullTenseBlock.new
                end
              end
            end
          end
        end
      end
    end
  end
end
