module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Semideponent
            extend Forwardable
            def_delegators :@verb, :original_string

            def initialize(verb, querent, opts={})
              @verb = verb
              @querent = querent
              @proxyVerb = LatinVerb.new(proxy_string)

              mutate!
            end

            def mutate!
              p = @proxyVerb
              @querent.instance_eval do
                @proxyVerb = p
                def active_voice_indicative_mood_present_tense
                  return @proxyVerb.send :active_voice_indicative_mood_present_tense
                end

                def active_voice_indicative_mood_imperfect_tense
                  return @proxyVerb.send :active_voice_indicative_mood_imperfect_tense
                end

                def active_voice_indicative_mood_future_tense
                  return @proxyVerb.send :active_voice_indicative_mood_future_tense
                end

                # These methods handle the strangeness of semi-deponents, it masks
                # passive perfects to active perfects

                def active_voice_indicative_mood_perfect_tense
                  return @proxyVerb.send :passive_voice_indicative_mood_perfect_tense
                end

                def active_voice_indicative_mood_pastperfect_tense
                  return @proxyVerb.send :passive_voice_indicative_mood_pastperfect_tense
                end

                def active_voice_indicative_mood_futureperfect_tense
                  return @proxyVerb.send :passive_voice_indicative_mood_futureperfect_tense
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

                # Subjunctives: 2 active, 2 passive
                def active_voice_subjunctive_mood_present_tense
                  return @proxyVerb.send :active_voice_subjunctive_mood_present_tense
                end

                def active_voice_subjunctive_mood_imperfect_tense
                  return @proxyVerb.send :active_voice_subjunctive_mood_imperfect_tense
                end

                def active_voice_subjunctive_mood_perfect_tense
                  return @proxyVerb.send :passive_voice_subjunctive_mood_perfect_tense
                end

                def active_voice_subjunctive_mood_pastperfect_tense
                  return @proxyVerb.send :passive_voice_subjunctive_mood_pastperfect_tense
                end

                def passive_voice_subjunctive_mood_perfect_tense
                  return NullTenseBlock.new
                end

                def passive_voice_subjunctive_mood_pastperfect_tense
                  return NullTenseBlock.new
                end
              end
            end

            def proxy_string
              DeponentStringDeriver.new(original_string).proxy_string
            end
          end
        end
      end
    end
  end
end
