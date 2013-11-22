require_relative 'irregular/json_deserializer'
require_relative 'irregular/json_revivifier'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            def initialize(mutatee, defining_string)
              @mutatee = mutatee
              @defining_string = defining_string
            end

            def mutate!
              deserializer = Deserializer.new(@defining_string)
              Revivifier.new(@mutatee, deserializer.revivified_data_structure)
              @mutatee
            end
          end
        end
      end
    end
  end
end
