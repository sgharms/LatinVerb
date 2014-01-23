module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          module QuerentForClassificationStrategy
            class Deponent < Regular
              extend Forwardable
              def_delegators :@verb, :original_string

              def initialize(verb)
                super
                prepare_deponent_proxy!
                reroute_active_calls_to_proxys_passives!
              end

              private

              def prepare_deponent_proxy!
                @querent.extend Forwardable
                @querent.instance_variable_set(:@deponentProxy, LatinVerb.new(proxy_string, :proxy_verb => true))
              end

              def reroute_active_calls_to_proxys_passives!
                passive_and_active_pairs do |passive_method_name, active_method_name|
                  @querent.def_delegator "@deponentProxy", passive_method_name, active_method_name
                end
              end

              def passive_and_active_pairs
                LatinVerb::Querent::PASSIVE_TENSE_METHODS.map do |passive_method_name|
                  active_correlate = passive_method_name.to_s.sub(/^passive(.*)/, "active\\1")
                  yield passive_method_name, active_correlate
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
end
