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
          include ThirdIO::ActiveVoiceIndicativeMoodFutureTenseMethods
          include ThirdIO::ActiveVoiceIndicativeMoodImperfectTenseMethods
          include ThirdIO::ActiveVoiceIndicativeMoodPresentTenseMethods
          include ThirdIO::ActiveVoiceSubjunctiveMoodPresentTenseMethods
          include ThirdIO::PassiveVoiceIndicativeMoodFutureTenseMethods
          include ThirdIO::PassivevoiceIndicativeMoodImperfectTenseMethods
          include ThirdIO::PassiveVoiceIndicativeMoodPresentTenseMethods
          include ThirdIO::PassiveVoiceSubjunctiveMoodPresentTenseMethods
        end
      end
    end
  end
end
