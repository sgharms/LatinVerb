module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            class ParticipleMutator
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
              end
            end
          end
        end
      end
    end
  end
end
