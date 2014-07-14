#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            attr_reader :querent

            def initialize(lookup_string, passive_perfect_participle, *args)
              @structure = JsonDeserializer.new(lookup_string).revivified_data_structure
              @original_string = Array(args).first
              @querent = LatinVerb::IrregularQuerent.new(@structure)
            end

            def imperative_handler
              raw = @structure["tense_blocks"]
              source = raw["active_voice_imperative_mood_present_tense"] || raw["active voice_imperative_mood_present_tense"]
              raw = source["data"]
              OpenStruct.new( :imperatives => [String(raw[1]).gsub(/\s+/,''), String(raw[4]).gsub(/\s+/,'')] )
            end

            def infinitivizer
              OpenStruct.new(@structure['infinitives']['data'].merge(:participle_methods => @structure['participles']['data'].keys))
            end

            def participler
              participles_data = @structure['participles']['data']
              supine_data = SupineInferrer.new(participles_data["perfect_passive_participle"]).supine
              OpenStruct.new(participles_data.merge({:supine => supine_data}))
            end
          end
        end
      end
    end
  end
end
