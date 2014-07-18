module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularImperativesHandler
          def self.new(verb)
            Linguistics::Latin::Verb::LatinVerb::IrregularImperativesRetriever.new(verb.original_string).retrieve
          end
        end
      end
    end
  end
end
