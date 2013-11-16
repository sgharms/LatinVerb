module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            class TenseBlockMutator
              def initialize(verb, proxyVerb)
                @verb = verb
                @proxyVerb = proxyVerb
                @querent = @proxyVerb.querent

                mutate!
              end

              ##
              #
              # Swaps this verb's active_ vectors and replaces them with
              # @proxyVerb's passive_ vectors.  This is pretty darned sneaky. See
              # Also deponent_swap
              #
              ##
              def mutate!

                # TENSE BLOCK STUFF HERE:
                storage = {}

                @querent.methods.grep(/\Apassive.+tense\z/).each do |pass|
                  # Find the active correlate
                  active_corr = pass.to_s.sub( /^passive(.*)/, "active\\1" )

                  #  Keep @proxyVerb in the binding scope
                  pV = @proxyVerb

                  # In verb, find the passive and save its resultant object into a
                  # hash for future use.
                  @verb.querent.instance_eval do
                    storage[active_corr.to_sym] = pV.send(pass)
                  end
                end

                # Take the stored hashes and define instance methods on verb such
                # that we intercept the mixed-in methods ( C-c-c-combo breaker! ).
                storage.each_pair do |k,v|
                  @verb.querent.singleton_class.class_eval do
                    define_method k, Proc.new { return v }
                  end
                end

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
end
