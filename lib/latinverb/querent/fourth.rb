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
          include Fourth::ActiveVoiceIndicativeMoodFutureTenseMethods
          include Fourth::ActiveVoiceIndicativeMoodImperfectTenseMethods
          include Fourth::ActiveVoiceIndicativeMoodPresentTenseMethods
          include Fourth::ActiveVoiceSubjunctiveMoodPresentTenseMethods
          include Fourth::PassiveVoiceIndicativeMoodFutureTenseMethods
          include Fourth::PassivevoiceIndicativeMoodImperfectTenseMethods
          include Fourth::PassiveVoiceIndicativeMoodPresentTenseMethods
          include Fourth::PassiveVoiceSubjunctiveMoodPresentTenseMethods
        end
      end
    end
  end
end
