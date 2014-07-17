module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularInfinitivesHandler
          def self.new(verb)
            QuerentMutators::Irregular.new(verb.original_string, verb.passive_perfect_participle).infinitivizer
          end
        end
      end
    end
  end
end
