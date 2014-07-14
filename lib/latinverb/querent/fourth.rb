#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class FourthQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            Fourth::ActiveVoiceIndicativeMoodFutureTenseMethods,
            Fourth::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            Fourth::ActiveVoiceIndicativeMoodPresentTenseMethods,
            Fourth::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            Fourth::PassiveVoiceIndicativeMoodFutureTenseMethods,
            Fourth::PassivevoiceIndicativeMoodImperfectTenseMethods,
            Fourth::PassiveVoiceIndicativeMoodPresentTenseMethods,
            Fourth::PassiveVoiceSubjunctiveMoodPresentTenseMethods
          ]

          def tense_definitions_template
            TENSE_METHOD_DEFINITIONS
          end
        end
      end
    end
  end
end
