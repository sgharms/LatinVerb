module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularQuerent < Querent
          def initialize(*args)
            @verb = args[0] if !args.empty?
            @added_vectorized_method = []
          end

          def imperatives
            OpenStruct.new( :future => Proc.new{}, :present => Proc.new{} )
          end

          def active_voice_indicative_mood_present_tense
            TenseBlock.new ["", "", @verb.original_string, "", "", ""]
          end

          def active_voice_indicative_mood_present_tense_third_person_singular_number
            return @verb.querent.active_voice_indicative_mood_present_tense[2]
          end
        end
      end
    end
  end
end
