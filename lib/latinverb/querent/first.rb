# encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class FirstQuerent < Querent
          TENSE_METHOD_DEFINITIONS = [
            First::ActiveVoiceIndicativeMoodFutureTenseMethods,
            First::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            First::ActiveVoiceIndicativeMoodPresentTenseMethods,
            First::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            First::PassiveVoiceIndicativeMoodFutureTenseMethods,
            First::PassivevoiceIndicativeMoodImperfectTenseMethods,
            First::PassiveVoiceIndicativeMoodPresentTenseMethods,
            First::PassiveVoiceSubjunctiveMoodPresentTenseMethods
          ]

          def tense_definitions_template
            TENSE_METHOD_DEFINITIONS
          end
        end
      end
    end
  end
end
