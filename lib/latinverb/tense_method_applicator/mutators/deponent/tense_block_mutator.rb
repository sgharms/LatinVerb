module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Deponent
            class TenseBlockMutator
              def initialize(verb, proxyVerb)
                @verb = verb
                @querent = verb.querent
                @proxyVerb = proxyVerb

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
                # First, get the methods that were defined in the proxy as passive

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
              end
            end
          end
        end
      end
    end
  end
end
