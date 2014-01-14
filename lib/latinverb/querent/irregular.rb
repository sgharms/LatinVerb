module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularQuerent < Querent
          def initialize(deserialized_structure)
            @structure = OpenStruct.new(deserialized_structure)
            @added_vectorized_method = []
          end

          def add_method(method_name)
            @added_vectorized_method << method_name.to_sym
          end

          def imperatives
            OpenStruct.new( :future => Proc.new{}, :present => Proc.new{} )
          end

          def active_voice_imperative_mood_future_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_imperative_mood_present_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_future_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_futureperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_imperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_pastperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_perfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_indicative_mood_present_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_subjunctive_mood_imperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_subjunctive_mood_pastperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_subjunctive_mood_perfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def active_voice_subjunctive_mood_present_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_future_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_futureperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_imperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_pastperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_perfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_indicative_mood_present_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_subjunctive_mood_imperfect_tense
            deserialized_tense_block_accessor(__method__)

          end
          def passive_voice_subjunctive_mood_pastperfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_subjunctive_mood_perfect_tense
            deserialized_tense_block_accessor(__method__)
          end

          def passive_voice_subjunctive_mood_present_tense
            deserialized_tense_block_accessor(__method__)
          end


          private

          def tense_blocks
            @tense_blocks ||= OpenStruct.new(@structure["tense_blocks"])
          end
            
          def deserialized_tense_block_accessor(block_name)
            serialized_tense_block = tense_blocks.send(block_name)["data"]
            opts = {:meaning => MEANINGS[block_name.to_sym]}
            TenseBlock.new(serialized_tense_block, opts)
          end
        end
      end
    end
  end
end
