module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentInfinitivizer < Infinitivizer
          extend Forwardable
          def_delegators :@verb, :original_string

          def initialize(verb)
            super
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string, :proxy_verb => true)
          end

          def infinitives
            {
              :present_active_infinitive  => present_active_infinitive,
              :perfect_active_infinitive  => perfect_active_infinitive,
              :future_active_infinitive   => future_active_infinitive,
              :present_passive_infinitive => present_passive_infinitive,
              :perfect_passive_infinitive => perfect_passive_infinitive,
              :future_passive_infinitive  => future_passive_infinitive
            }
          end

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
