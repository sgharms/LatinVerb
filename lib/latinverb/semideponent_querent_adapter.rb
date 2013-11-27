module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SemideponentQuerentAdapter # TODO:  fix horrible name
          extend Forwardable
          def_delegators :@verb, :original_string
          def_delegators :@proxyVerb,  :active_voice_indicative_mood_present_tense, :active_voice_indicative_mood_imperfect_tense, :active_voice_indicative_mood_future_tense, :passive_voice_indicative_mood_perfect_tense, :passive_voice_indicative_mood_pastperfect_tense, :passive_voice_indicative_mood_futureperfect_tense, :active_voice_subjunctive_mood_present_tense, :active_voice_subjunctive_mood_imperfect_tense, :passive_voice_subjunctive_mood_perfect_tense, :passive_voice_subjunctive_mood_pastperfect_tense
          def_delegators :@wrapped_querent,  :active_voice_subjunctive_mood_perfect_tense, :active_voice_subjunctive_mood_pastperfect_tense

          def initialize(verb, wrapped_querent)
            @verb = verb
            @wrapped_querent = wrapped_querent
            @proxyVerb = LatinVerb.new(proxy_string) #TODO: prefer proxy_string to other long-winded invocations
          end

          def proxy_string
            DeponentStringDeriver.new(original_string).proxy_string
          end

          def active_voice_indicative_mood_perfect_tense
            return @proxyVerb.send(:passive_voice_indicative_mood_perfect_tense)
          end

          def active_voice_indicative_mood_pastperfect_tense
            return @proxyVerb.send :passive_voice_indicative_mood_pastperfect_tense
          end

          def active_voice_indicative_mood_futureperfect_tense
            return @proxyVerb.send :passive_voice_indicative_mood_futureperfect_tense
          end

          def active_voice_subjunctive_mood_perfect_tense
            return @proxyVerb.send :passive_voice_subjunctive_mood_perfect_tense
          end

          def active_voice_subjunctive_mood_pastperfect_tense
            return @proxyVerb.send :passive_voice_subjunctive_mood_pastperfect_tense
          end

          ##### UP

          def passive_voice_subjunctive_mood_perfect_tense
            return NullTenseBlock.new
          end

          def passive_voice_subjunctive_mood_pastperfect_tense
            return NullTenseBlock.new
          end

          def passive_voice_indicative_mood_perfect_tense
            return NullTenseBlock.new
          end

          def passive_voice_indicative_mood_pastperfect_tense
            return NullTenseBlock.new
          end

          def passive_voice_indicative_mood_futureperfect_tense
            return NullTenseBlock.new
          end
        end
      end
    end
  end
end