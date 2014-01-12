#encoding: UTF-8

require_relative './tense_method_definitions/active_voice_imperative_mood_future_tense_methods'
require_relative './tense_method_definitions/active_voice_imperative_mood_present_tense_methods'
require_relative './tense_method_definitions/active_voice_indicative_mood_futureperfect_tense_methods'
require_relative './tense_method_definitions/active_voice_indicative_mood_pastperfect_tense_methods'
require_relative './tense_method_definitions/active_voice_indicative_mood_perfect_tense_methods'
require_relative './tense_method_definitions/active_voice_subjunctive_mood_imperfect_tense_methods'
require_relative './tense_method_definitions/active_voice_subjunctive_mood_pastperfect_tense_methods'
require_relative './tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require_relative './tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_indicative_mood_futureperfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_indicative_mood_pastperfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_indicative_mood_perfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_subjunctive_mood_pastperfect_tense_methods'
require_relative './tense_method_definitions/passive_voice_subjunctive_mood_perfect_tense_methods'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          TENSE_METHOD_DEFINITIONS = [
            Querent::ActiveVoiceImperativeMoodFutureTenseMethods,
            Querent::ActiveVoiceImperativeMoodPresentTenseMethods,
            Querent::ActiveVoiceIndicativeMoodFutureperfectTenseMethods,
            Querent::ActiveVoiceIndicativeMoodPastperfectTenseMethods,
            Querent::ActiveVoiceIndicativeMoodPerfectTenseMethods,
            Querent::ActiveVoiceSubjunctiveMoodImperfectTenseMethods,
            Querent::ActiveVoiceSubjunctiveMoodPastPerfectTenseMethods,
            Querent::ActiveVoiceSubjunctiveMoodPerfectTenseMethods,
            Querent::PassiveVoiceIndicativeMoodFutureperfectTenseMethods,
            Querent::PassiveVoiceIndicativeMoodPastperfectTenseMethods,
            Querent::PassiveVoiceIndicativeMoodPerfectTMethods,
            Querent::PassiveVoiceSubjunctiveMoodImperfectTenseMethods,
            Querent::PassiveVoiceSubjunctiveMoodPastperfectTenseMethods,
            Querent::PassiveVoiceSubjunctiveMoodPerfectTenseMethods
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
          def_delegators :@verb, :stem, :imperatives, :first_person_singular, :first_person_perfect,
            :present_active_infinitive, :passive_perfect_participle, :present_active_infinitive, :verb_type

          def initialize(verb)
            @verb = verb
            @added_vectorized_method = []

            add_tense_methods!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
          end

          def tense_definitions_template
            []
          end

          def passive_tense_methods
            PASSIVE_TENSE_METHODS
          end

          def active_tense_methods
            ACTIVE_TENSE_METHODS
          end

          def self.tense_block_methods
            ACTIVE_TENSE_METHODS + PASSIVE_TENSE_METHODS
          end

          def tense_block_methods
            self.class.tense_block_methods
          end

          def defined_tense_methods
             tense_block_methods + Array(@added_vectorized_method)
          end

          def add_method(method_symbol)
            @added_vectorized_method << method_symbol
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
