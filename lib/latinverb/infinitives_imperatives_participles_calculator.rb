module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class InfinitivesImperativesParticiplesCalculator
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

          def components_for_irregular
            builder = QuerentMutators::Irregular.new(@verb.original_string, @verb.passive_perfect_participle)
            [ builder.infinitivizer, builder.imperative_handler, builder.participler ]
          end

          def deponent_components
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string, :proxy_verb => true)
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
