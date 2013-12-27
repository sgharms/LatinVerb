module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
            class TenseBlockMutator
              def initialize(verb, querent, proxyVerb)
                @verb = verb
                @proxyVerb = proxyVerb
                @querent = querent
                @proxyQuerent = @proxyVerb.querent

                mutate!
              end

              def mutate!
                migrate_proxy_querents_passive_methods_to_active
              end

              def passive_calls_on_proxy
                return LatinVerb::Querent::PASSIVE_TENSE_METHODS
              end

              def active_correlate(passive_vector_name)
                passive_vector_name.to_s.sub( /^passive(.*)/, "active\\1" )
              end

              def mapping_from_proxy_querent_passive_to_current_active
                locally_bound_proxy_verb = @proxyVerb

                passive_calls_on_proxy.each_with_object({}) do |passive_name, memo|
                  key = active_correlate(passive_name).to_sym
                  memo[key] = locally_bound_proxy_verb.send(passive_name)
                end
              end

              def migrate_proxy_querents_passive_methods_to_active
                local_full_querent = @querent
                mapping_from_proxy_querent_passive_to_current_active.each_pair do |method_name, method_body|
                  local_full_querent.singleton_class.class_eval do
                    define_method method_name, Proc.new { return method_body }
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
