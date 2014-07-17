module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularParticiplesHandler
          def self.new(verb)
            QuerentMutators::Irregular.new(verb.original_string, verb.passive_perfect_participle).participler
          end
        end
      end
    end
  end
end

