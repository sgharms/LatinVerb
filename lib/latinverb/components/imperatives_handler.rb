module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImperativesHandler
          extend Forwardable

          def_delegators :@verb, :stem, :present_active_infinitive

          IMPERATIVE_EXCEPTIONS = {
            "ducere"   => %w(duc ducite),
            "dicere"   => %w(dic dicite),
            "facere"   => %w(fac facite),
            "ferre"    => %w(fer ferte),
            "nolere"   => %w(nolo nolite)
          }

          def initialize(verb)
            @verb = verb
          end

          def imperatives
            args = exceptional_imperative? ? calculate_exceptional_imperatives : [stem, present_active_infinitive]
            Linguistics::Latin::Verb::ImperativeBlock.new(*args, @verb)
          end

          private

          def exceptional_imperative?
            IMPERATIVE_EXCEPTIONS.has_key?(present_active_infinitive)
          end

          def calculate_exceptional_imperatives
            IMPERATIVE_EXCEPTIONS[present_active_infinitive]
          end
        end
      end
    end
  end
end
