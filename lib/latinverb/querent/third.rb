#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ThirdQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            Third::ActiveVoiceIndicativeMoodFutureTenseMethods,
            Third::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            Third::ActiveVoiceIndicativeMoodPresentTenseMethods,
            Third::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            Third::PassiveVoiceIndicativeMoodFutureTenseMethods,
            Third::PassivevoiceIndicativeMoodImperfectTenseMethods,
            Third::PassiveVoiceIndicativeMoodPresentTenseMethods,
            Third::PassiveVoiceSubjunctiveMoodPresentTenseMethods
          ]

          def tense_definitions_template
            TENSE_METHOD_DEFINITIONS
          end
        end
      end
    end
  end
end
