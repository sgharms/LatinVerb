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

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SemideponentQuerentAdapter
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

          PASSIVE_TENSE_METHODS = [
            :passive_voice_indicative_mood_futureperfect_tense,
            :passive_voice_indicative_mood_future_tense,
            :passive_voice_indicative_mood_imperfect_tense,
            :passive_voice_indicative_mood_pastperfect_tense,
            :passive_voice_indicative_mood_perfect_tense,
            :passive_voice_indicative_mood_present_tense,
            :passive_voice_subjunctive_mood_imperfect_tense,
            :passive_voice_subjunctive_mood_pastperfect_tense,
            :passive_voice_subjunctive_mood_perfect_tense,
            :passive_voice_subjunctive_mood_present_tense
          ]

          ACTIVE_TENSE_METHODS = [
            :active_voice_imperative_mood_future_tense,
            :active_voice_imperative_mood_present_tense,
            :active_voice_indicative_mood_future_tense,
            :active_voice_indicative_mood_futureperfect_tense,
            :active_voice_indicative_mood_imperfect_tense,
            :active_voice_indicative_mood_pastperfect_tense,
            :active_voice_indicative_mood_perfect_tense,
            :active_voice_indicative_mood_present_tense,
            :active_voice_subjunctive_mood_imperfect_tense,
            :active_voice_subjunctive_mood_pastperfect_tense,
            :active_voice_subjunctive_mood_perfect_tense,
            :active_voice_subjunctive_mood_present_tense,
          ]
          extend Forwardable
          #def_delegators :@wrapped_querent,  :active_voice_subjunctive_mood_perfect_tense, :active_voice_subjunctive_mood_pastperfect_tense, :defined_tense_methods

          def_delegators :@verb, :original_string

          def initialize(verb, wrapped_querent)
            @verb = verb
            @wrapped_querent = wrapped_querent
            @proxyVerb = LatinVerb.new(proxy_string)
            @added_vectorized_method = []

            add_tense_methods!
            hide_unused_passive_tenses!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
          end

          def querent
            self
          end

          def defined_tense_methods
            tense_block_methods + Array(@added_vectorized_method)
          end

          def self.tense_block_methods
            ACTIVE_TENSE_METHODS + PASSIVE_TENSE_METHODS
          end

          def tense_block_methods
            self.class.tense_block_methods
          end

          def tense_definitions_template
            []
          end

          private

          def hide_unused_passive_tenses!
            self.extend(NullifiedPassiveVoiceTenseBlocks)
          end

          def proxy_string
            DeponentStringDeriver.new(original_string).proxy_string
          end

          protected

          def extend_with_tense_method_definitions!(tense_method_definitions)
            tense_method_definitions.each{ |definition| self.extend(definition) }
          end

          def register_methods!(tense_method_definitions)
            tense_method_definitions.each{ |definition| @added_vectorized_method += definition.instance_methods }
          end
        end
      end
    end
  end
end
