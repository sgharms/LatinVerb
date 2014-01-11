# encoding: UTF-8

require_relative './first/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require_relative './first/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require_relative './first/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require_relative './first/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require_relative './first/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require_relative './first/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './first/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require_relative './first/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class FirstQuerent < Querent
          include First::ActiveVoiceIndicativeMoodFutureTenseMethods
          include First::ActiveVoiceIndicativeMoodImperfectTenseMethods
          include First::ActiveVoiceIndicativeMoodPresentTenseMethods
          include First::ActiveVoiceSubjunctiveMoodPresentTenseMethods
          include First::PassiveVoiceIndicativeMoodFutureTenseMethods
          include First::PassivevoiceIndicativeMoodImperfectTenseMethods
          include First::PassiveVoiceIndicativeMoodPresentTenseMethods
          include First::PassiveVoiceSubjunctiveMoodPresentTenseMethods
        end
      end
    end
  end
end
