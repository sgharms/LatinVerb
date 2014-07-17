require_relative 'irregular/json_deserializer'
require_relative 'irregular/json_revivifier'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            def initialize(verb)
              @verb = verb
              @deserializer = Deserializer.new(@verb)
            end

            def mutate!
              Revivifier.new(@verb, @deserializer.revivified_data_structure)
            end
          end
        end
      end
    end
  end
end
