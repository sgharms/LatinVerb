module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularInfinitivesHandler
          def self.new(verb)
            structure =
              JSON.parse(Linguistics::Latin::Verb::LatinVerb::IrregularVerbSerializationRetriever.new(verb.original_string).serialized_verb)
            raw = structure["tense_blocks"]
            source = raw["active_voice_imperative_mood_present_tense"] || raw["active voice_imperative_mood_present_tense"]
            raw = source["data"]
            OpenStruct.new(structure['infinitives']['data'].merge(:participle_methods => structure['participles']['data'].keys))
          end
        end
      end
    end
  end
end
