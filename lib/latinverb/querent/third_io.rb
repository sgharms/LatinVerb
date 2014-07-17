#encoding: UTF-8

require_relative './third_io/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require_relative './third_io/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require_relative './third_io/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require_relative './third_io/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require_relative './third_io/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require_relative './third_io/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './third_io/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require_relative './third_io/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

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
