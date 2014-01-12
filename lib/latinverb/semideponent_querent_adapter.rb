require 'latinverb/semideponent_querent_adapter/nullified_passive_voice_tense_blocks'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SemideponentQuerentAdapter
          extend Forwardable
          def_delegators :@verb, :original_string
          def_delegators :@proxyVerb, :active_voice_indicative_mood_present_tense, :active_voice_indicative_mood_imperfect_tense, :active_voice_indicative_mood_future_tense, :passive_voice_indicative_mood_perfect_tense, :passive_voice_indicative_mood_pastperfect_tense, :passive_voice_indicative_mood_futureperfect_tense, :active_voice_subjunctive_mood_present_tense, :active_voice_subjunctive_mood_imperfect_tense, :passive_voice_subjunctive_mood_perfect_tense, :passive_voice_subjunctive_mood_pastperfect_tense
          def_delegators :@wrapped_querent,  :active_voice_subjunctive_mood_perfect_tense, :active_voice_subjunctive_mood_pastperfect_tense, :defined_tense_methods

    def_delegator :@proxyVerb, :passive_voice_indicative_mood_perfect_tense, :active_voice_indicative_mood_perfect_tense
    def_delegator :@proxyVerb, :passive_voice_indicative_mood_pastperfect_tense,  :active_voice_indicative_mood_pastperfect_tense
    def_delegator :@proxyVerb, :passive_voice_indicative_mood_futureperfect_tense,  :active_voice_indicative_mood_futureperfect_tense
    def_delegator :@proxyVerb, :passive_voice_subjunctive_mood_perfect_tense,  :active_voice_subjunctive_mood_perfect_tense
    def_delegator :@proxyVerb, :passive_voice_subjunctive_mood_pastperfect_tense,  :active_voice_subjunctive_mood_pastperfect_tense

          def initialize(verb, wrapped_querent)
            @verb = verb
            @wrapped_querent = wrapped_querent
            @proxyVerb = LatinVerb.new(proxy_string)
            @added_vectorized_method = []
            self.extend(NullifiedPassiveVoiceTenseBlocks)
            QuerentTenseMethodsVectorizer.new(self).add_vector_methods!
          end

          def add_method(sym)
            @added_vectorized_method << sym
          end

          def tense_block_methods
            Querent.tense_block_methods
          end

          def proxy_string
            DeponentStringDeriver.new(original_string).proxy_string
          end
        end
      end
    end
  end
end
