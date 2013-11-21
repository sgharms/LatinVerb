require_relative 'irregular/json_deserializer'
require_relative 'irregular/json_revivifier'
require_relative 'irregular/present_only_irregular_mask'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            def initialize(verb)
              byebug; #neu
              @verb = verb
              @deserializer = Deserializer.new(@verb)
            end

            def mutate!
              Revivifier.new(@verb, @deserializer.revivified_data_structure)
              PresentOnlyIrregularMask.new(@verb).apply!
            end
          end
        end
      end
    end
  end
end
