#encoding: UTF-8

require_relative './fourth/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require_relative './fourth/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require_relative './fourth/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require_relative './fourth/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require_relative './fourth/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require_relative './fourth/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './fourth/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require_relative './fourth/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

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
