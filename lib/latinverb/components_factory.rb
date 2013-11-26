module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ComponentsFactory
          extend Forwardable
          def_delegators :@verb, :irregular?, :deponent?, :semideponent?

          def initialize(verb)
            @verb = verb
          end

          def components
            return components_for_irregular if irregular?
            if deponent? || semideponent?
              components_for_deponents
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

          def standard_components
            [ Infinitivizer.new(@verb), ImperativesHandler.new(@verb), Participler.new(@verb) ]
          end
        end
      end
    end
  end
end
