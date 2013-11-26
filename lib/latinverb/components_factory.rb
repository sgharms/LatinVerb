module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ComponentsFactory
          extend Forwardable
          def_delegators :@verb, :irregular?, :deponent?, :semideponent?, :original_string

          def initialize(verb)
            @verb = verb
          end

          def components
            return components_for_irregular if irregular?
            if deponent? || semideponent?
              deponent_components
            else
              standard_components
            end
          end

          def components_for_irregular # TODO use strategy or mapping
            IrregularComponentsBuilder.new(@verb).components
          end

          def components_for_deponents
            DeponentComponentsBuilder.new(@verb).components
          end

          def deponent_components
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
            #LatinVerb::DeponentParticipler.new(@verb)
            DeponentParticipler.new(@verb)
            DeponentInfinitzer.new(@verb)
            [ Infinitivizer.new(@verb), ImperativesHandler.new(@verb), Participler.new(@verb) ]
          end

          def standard_components
            [ Infinitivizer.new(@verb), ImperativesHandler.new(@verb), Participler.new(@verb) ]
          end

          class DeponentParticipler
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

        end
      end
    end
  end
end
