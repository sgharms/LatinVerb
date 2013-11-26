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
              DeponentComponentsBuilder.new(@verb).components
            else
              components
            end
          end

          def components_for_irregular
            byebug;
            IrregularComponentsBuilder.new(@verb).components
          end

          def components
            [ Infinitivizer.new(@verb), ImperativesHandler.new(@verb), Participler.new(@verb) ]
          end
        end
      end
    end
  end
end
