module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Deponent
            class ParticipleMutator
              def initialize(verb, proxyVerb)
                @verb = verb
                @proxyVerb = proxyVerb
                mutate!
              end

              def mutate!
                proxyVerb = @proxyVerb
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
              end
            end
          end
        end
      end
    end
  end
end
