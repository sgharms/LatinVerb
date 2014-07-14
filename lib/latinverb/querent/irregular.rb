
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            IrregularQuerent::ActiveVoiceImperativeMoodFutureTenseMethods,
            IrregularQuerent::ActiveVoiceImperativeMoodPresentTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodFutureTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodFutureperfectTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodPastperfectTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodPerfectTenseMethods,
            IrregularQuerent::ActiveVoiceIndicativeMoodPresentTenseMethods,
            IrregularQuerent::ActiveVoiceSubjunctiveMoodImperfectTenseMethods,
            IrregularQuerent::ActiveVoiceSubjunctiveMoodPastperfectTenseMethods,
            IrregularQuerent::ActiveVoiceSubjunctiveMoodPerfectTenseMethods,
            IrregularQuerent::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodFutureTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodFutureperfectTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodImperfectTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodPastperfectTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodPerfectTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodPresentTenseMethods,
            IrregularQuerent::PassiveVoiceIndicativeMoodPresentTenseMethods,
            IrregularQuerent::PassiveVoiceSubjunctiveMoodImperfectTenseMethods,
            IrregularQuerent::PassiveVoiceSubjunctiveMoodPastperfectTenseMethods,
            IrregularQuerent::PassiveVoiceSubjunctiveMoodPerfectTenseMethods,
            IrregularQuerent::PassiveVoiceSubjunctiveMoodPresentTenseMethods,
          ]

          def initialize(deserialized_structure)
            @structure = OpenStruct.new(deserialized_structure)
            @added_vectorized_methods = []

            add_tense_methods!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
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
