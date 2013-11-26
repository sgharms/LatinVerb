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

          def deponent_components
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
            [ DeponentInfinitivizer.new(@verb), DeponentImperativesHandler.new(@verb), DeponentParticipler.new(@verb) ]
          end

          def standard_components
            [ Infinitivizer.new(@verb), ImperativesHandler.new(@verb), Participler.new(@verb) ]
          end
        end
      end
    end
  end
end
