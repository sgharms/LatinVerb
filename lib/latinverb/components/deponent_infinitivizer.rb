require_relative './passive_infinitive_factory'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentInfinitivizer
          extend Forwardable
          def initialize(verb)
            super
            DeponentInfinitzer.new(@verb)
          end

          class DeponentInfinitzer
            extend Forwardable
            def_delegators :@verb, :original_string

            def initialize(verb)
              @verb = verb
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
              bad
            end

            def bad #TODO: rm
              proxyVerb = @proxyVerb
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

          def perfect_active_infinitive
            first_person_perfect + "sse"
          end

          def future_active_infinitive
            future_active_participle.sub(/,.*/,'') + " esse"
          end

          def present_passive_infinitive
            PassiveInfinitiveFactory.new(@verb).passive_infinitive
          end

          def perfect_passive_infinitive
            perfect_passive_participle + " esse"
          end

          def future_passive_infinitive
            supine[:accusative] + " īrī"
          end


        end
      end
    end
  end
end
