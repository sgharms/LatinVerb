module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DynamicMethodResolver
          def initialize(verb, method_name)
            @verb = verb
            @method_name = method_name.to_s
          end

          def components
            @method_name.split('_')
          end

          def tense_method
            Array(components[0..5]).join('_')
          end

          def vector_specifier
            Array(components[6..-1]).join('_')
          end

          def supported_method?
            !(tense_method.nil? || vector_specifier.nil?) && @method_name.match(/_/)
          end

          def apply!
            if @verb.respond_to?(tense_method.to_sym)
              tense_block = @verb.send(tense_method.to_sym)
              return false if tense_block.nil?
              tense_block.send(vector_specifier.to_sym)
            else
              false
            end
          end

        end
      end
    end
  end
end
