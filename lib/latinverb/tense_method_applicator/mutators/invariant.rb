require_relative './invariant/active_voice_imperative_mood_future_tense_strategy'
require_relative './invariant/active_voice_imperative_mood_present_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_futureperfect_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_future_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_imperfect_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_pastperfect_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_perfect_tense_strategy'
require_relative './invariant/active_voice_indicative_mood_present_tense_strategy'
require_relative './invariant/active_voice_subjunctive_mood_imperfect_tense_strategy'
require_relative './invariant/active_voice_subjunctive_mood_pastperfect_tense_strategy'
require_relative './invariant/active_voice_subjunctive_mood_perfect_tense_strategy'
require_relative './invariant/active_voice_subjunctive_mood_present_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_futureperfect_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_future_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_imperfect_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_pastperfect_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_perfect_tense_strategy'
require_relative './invariant/passive_voice_indicative_mood_present_tense_strategy'
require_relative './invariant/passive_voice_subjunctive_mood_imperfect_tense_strategy'
require_relative './invariant/passive_voice_subjunctive_mood_pastperfect_tense_strategy'
require_relative './invariant/passive_voice_subjunctive_mood_perfect_tense_strategy'
require_relative './invariant/passive_voice_subjunctive_mood_present_tense_strategy'
require_relative './invariant/imperatives'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant

            STRATEGIES = [
              ActiveVoiceImperativeMoodPresentTenseStrategy,
              ActiveVoiceImperativeMoodFutureTenseStrategy,
              ActiveVoiceIndicativeMoodFutureTenseStrategy,
              ActiveVoiceIndicativeMoodPastperfectTenseStrategy,
              ActiveVoiceIndicativeMoodPerfectTenseStrategy,
              ActiveVoiceSubjunctiveMoodImperfectTenseStrategy,
              ActiveVoiceSubjunctiveMoodPastperfectTenseStrategy,
              ActiveVoiceSubjunctiveMoodPerfectTenseStrategy,
              PassiveVoiceIndicativeMoodFutureperfectTenseStrategy,
              PassiveVoiceIndicativeMoodPastperfectTenseStrategy,
              PassiveVoiceIndicativeMoodPerfectTenseStrategy,
              PassiveVoiceSubjunctiveMoodImperfectTenseStrategy,
              PassiveVoiceSubjunctiveMoodPastperfectTenseStrategy,
              PassiveVoiceSubjunctiveMoodPerfectTenseStrategy,
            ]

            def initialize(verb)
              @verb = verb
              apply_strategies!
            end

            def apply_strategies!
              STRATEGIES.each do |strategy|
                strategy.new(@verb).apply!
              end
            end
          end
        end
      end
    end
  end
end
