#encoding: UTF-8

require_relative './third/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require_relative './third/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require_relative './third/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require_relative './third/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require_relative './third/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require_relative './third/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './third/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require_relative './third/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ThirdQuerent < Querent
          include Third::ActiveVoiceIndicativeMoodFutureTenseMethods
          include Third::ActiveVoiceIndicativeMoodImperfectTenseMethods
          include Third::ActiveVoiceIndicativeMoodPresentTenseMethods
          include Third::ActiveVoiceSubjunctiveMoodPresentTenseMethods
          include Third::PassiveVoiceIndicativeMoodFutureTenseMethods
          include Third::PassivevoiceIndicativeMoodImperfectTenseMethods
          include Third::PassiveVoiceIndicativeMoodPresentTenseMethods
          include Third::PassiveVoiceSubjunctiveMoodPresentTenseMethods
        end
      end
    end
  end
end
