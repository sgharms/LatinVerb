module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularImperativesHandler
          def self.new(verb)
            structure =
              JSON.parse(Linguistics::Latin::Verb::LatinVerb::IrregularVerbSerializationRetriever.new(verb.original_string).serialized_verb)
            raw = structure["tense_blocks"]
            source = raw["active_voice_imperative_mood_present_tense"] || raw["active voice_imperative_mood_present_tense"]
            raw = source["data"]
            OpenStruct.new( :imperatives => [String(raw[1]).gsub(/\s+/,''), String(raw[4]).gsub(/\s+/,'')] )
          end
        end
      end
    end
  end
end
