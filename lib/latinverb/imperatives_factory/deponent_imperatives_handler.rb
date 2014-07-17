module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentImperativesHandler < ImperativesHandler
          extend Forwardable
          def_delegators :@proxyVerb, :stem, :present_active_infinitive
          def_delegators :@verb, :original_string

          def imperatives
            args = [stem, present_active_infinitive]
            Linguistics::Latin::Verb::ImperativeBlock.new(*args, @verb)
          end

          def stem
            Linguistics::Latin::Verb::LatinVerb::StemDeriver.new(@verb).stem[0..-3]
          end

          def present_active_infinitive
            Linguistics::Latin::Verb::LatinVerb::DeponentStringDeriver.new(original_string).proxy_string.split(/\s+/)[1]
          end
        end
      end
    end
  end
end
