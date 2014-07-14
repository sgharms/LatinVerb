#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          include Querent::QuerentInterface
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

          extend Forwardable
          def_delegators :@verb, :stem, :imperatives, :first_person_singular, :first_person_perfect,
            :present_active_infinitive, :passive_perfect_participle, :present_active_infinitive, :verb_type

          def initialize(verb)
            @verb = verb
            @added_vectorized_methods = []

            add_tense_methods!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
          end
        end
      end
    end
  end
end
