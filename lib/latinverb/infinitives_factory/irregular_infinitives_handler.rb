module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularInfinitivesHandler
          def self.new(verb)
            Linguistics::Latin::Verb::LatinVerb::IrregularInfinitivesRetriever.new(verb.original_string).retrieve
          end
        end
      end
    end
  end
end
