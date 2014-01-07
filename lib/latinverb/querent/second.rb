#encoding: UTF-8

require_relative './second/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require_relative './second/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require_relative './second/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require_relative './second/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require_relative './second/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require_relative './second/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './second/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require_relative './second/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SecondQuerent < Querent
          include Second::ActiveVoiceIndicativeMoodFutureTenseMethods
          include Second::ActiveVoiceIndicativeMoodImperfectTenseMethods
          include Second::ActiveVoiceIndicativeMoodPresentTenseMethods
          include Second::ActiveVoiceSubjunctiveMoodPresentTenseMethods
          include Second::PassiveVoiceIndicativeMoodFutureTenseMethods
          include Second::PassivevoiceIndicativeMoodImperfectTenseMethods
          include Second::PassiveVoiceIndicativeMoodPresentTenseMethods
          include Second::PassiveVoiceSubjunctiveMoodPresentTenseMethods
        end
      end
    end
  end
end
