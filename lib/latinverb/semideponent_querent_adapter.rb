require_relative 'semideponent_querent_adapter/nullified_passive_voice_tense_blocks'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_present_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_pastperfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_imperfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_perfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_future_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_indicative_mood_futureperfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_subjunctive_mood_imperfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_subjunctive_mood_perfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_subjunctive_mood_pastperfect_tense_methods'
require_relative 'semideponent_querent_adapter/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/querent_interface'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SemideponentQuerentAdapter
          include Querent::QuerentInterface
          TENSE_METHOD_DEFINITIONS = [
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPresentTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPerfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodFutureTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPastperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodFutureperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodImperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPerfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPastperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodImperfectTenseMethods
          ]

          extend Forwardable
          def_delegators :@verb, :original_string

          def initialize(verb, wrapped_querent)
            @verb = verb
            @wrapped_querent = wrapped_querent
            @proxyVerb = LatinVerb.new(proxy_string, :proxy_verb => true)
            @added_vectorized_method = []

            add_tense_methods!
            hide_unused_passive_tenses!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
          end

          private

          def hide_unused_passive_tenses!
            self.extend(NullifiedPassiveVoiceTenseBlocks)
          end

          def proxy_string
            DeponentStringDeriver.new(original_string).proxy_string
          end
        end
      end
    end
  end
end
