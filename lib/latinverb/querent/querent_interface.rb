module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Querent
          module QuerentInterface
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

            def add_tense_methods!
              raise "Implementors of QuerentInterface must implement `add_tense_methods!'"
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

            def defined_tense_methods
              Linguistics::Latin::Verb::LatinVerb::TENSE_BLOCK_NAMES +
                Array(@added_vectorized_methods)
            end

            protected

            def extend_with_tense_method_definitions!(tense_method_definitions)
              tense_method_definitions.each{ |definition| self.extend(definition) }
            end

            def register_methods!(tense_method_definitions)
              tense_method_definitions.each{ |definition| @added_vectorized_methods += definition.instance_methods }
            end
          end
        end
      end
    end
  end
end
