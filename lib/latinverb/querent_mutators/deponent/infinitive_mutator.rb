module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            class InfinitiveMutator
              def initialize(verb, querent, proxyVerb)
                @verb = verb
                @proxyVerb = proxyVerb
                @querent = querent

                mutate!
              end

              def mutate!
                proxyVerb = @proxyVerb
                @querent.instance_eval do
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
end
