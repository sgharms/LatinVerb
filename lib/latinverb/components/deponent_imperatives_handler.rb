module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentImperativesHandler < ImperativesHandler
          extend Forwardable
          def_delegators :@proxyVerb, :stem, :present_active_infinitive
          def_delegators :@verb, :original_string

          def initialize(verb)
            super
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string, :proxy_verb => true)
          end

          def imperatives
            args = [stem, present_active_infinitive]
            Linguistics::Latin::Verb::ImperativeBlock.new(*args, @verb)
          end

          def stem
            @proxyVerb.stem
          end

          def present_active_infinitive
            @proxyVerb.present_active_infinitive
          end
        end
      end
    end
  end
end
