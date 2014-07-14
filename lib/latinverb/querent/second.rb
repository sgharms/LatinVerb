#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SecondQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            Second::ActiveVoiceIndicativeMoodFutureTenseMethods,
            Second::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            Second::ActiveVoiceIndicativeMoodPresentTenseMethods,
            Second::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            Second::PassiveVoiceIndicativeMoodFutureTenseMethods,
            Second::PassivevoiceIndicativeMoodImperfectTenseMethods,
            Second::PassiveVoiceIndicativeMoodPresentTenseMethods,
            Second::PassiveVoiceSubjunctiveMoodPresentTenseMethods
          ]

          def tense_definitions_template
            TENSE_METHOD_DEFINITIONS
          end
        end
      end
    end
  end
end
