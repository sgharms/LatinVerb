module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularImperativesHandler
          def self.new(verb)
            QuerentMutators::Irregular.new(verb.original_string, verb.passive_perfect_participle).imperative_handler
          end
        end
      end
    end
  end
end
