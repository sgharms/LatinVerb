module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularParticiplesHandler
          def self.new(verb)
            structure =
              JSON.parse(Linguistics::Latin::Verb::LatinVerb::IrregularVerbSerializationRetriever.new(verb.original_string).serialized_verb)
            participles_data = structure['participles']['data']
            supine_data = SupineInferrer.new(participles_data["perfect_passive_participle"]).supine
            OpenStruct.new(participles_data.merge({:supine => supine_data}))
          end
        end
      end
    end
  end
end

