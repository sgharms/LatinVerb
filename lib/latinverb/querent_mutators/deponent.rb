require_relative './deponent/tense_block_mutator'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            extend Forwardable
            def_delegators :@verb, :original_string

            def initialize(verb, querent, opts={})
              @verb = verb
              @querent = querent
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
            end

            def mutate!
              TenseBlockMutator.new(@verb, @querent, @proxyVerb).mutate!
              bad
            end

            private

            def proxy_string
              DeponentStringDeriver.new(original_string).proxy_string
            end

            def bad
                proxyVerb = @proxyVerb
                # ParticipleMutator STUFF HERE:
                @verb.instance_eval do
                  @proxyVerb = proxyVerb

                  def present_active_participle
                    return @proxyVerb.present_active_participle
                  end

                  def future_active_participle
                    return @proxyVerb.future_active_participle
                  end

                  def perfect_active_participle
                    return @proxyVerb.perfect_passive_participle
                  end

                  def future_passive_participle
                    return @proxyVerb.future_passive_participle
                  end

                  # Mask the supine
                  def supine
                    return @proxyVerb.supine
                  end
                end


              # INFINITIVE MUTATOR STUFF HERE
                @verb.instance_eval do
                  @proxyVerb = proxyVerb

                  def present_active_infinitive
                    return @proxyVerb.send :present_passive_infinitive
                  end

                  def perfect_active_infinitive
                    return @proxyVerb.send :perfect_passive_infinitive
                  end

                  def future_active_infinitive
                    return @proxyVerb.send :future_active_infinitive
                  end

                  def present_passive_infinitive
                    return NullTenseBlock.new
                  end
                end
            end
          end
        end
      end
    end
  end
end
