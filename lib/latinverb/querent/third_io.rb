#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ThirdIOQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            ThirdIO::ActiveVoiceIndicativeMoodFutureTenseMethods,
            ThirdIO::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            ThirdIO::ActiveVoiceIndicativeMoodPresentTenseMethods,
            ThirdIO::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            ThirdIO::PassiveVoiceIndicativeMoodFutureTenseMethods,
            ThirdIO::PassivevoiceIndicativeMoodImperfectTenseMethods,
            ThirdIO::PassiveVoiceIndicativeMoodPresentTenseMethods,
            ThirdIO::PassiveVoiceSubjunctiveMoodPresentTenseMethods
          ]

          def tense_definitions_template
            TENSE_METHOD_DEFINITIONS
          end
        end
      end
    end
  end
end
