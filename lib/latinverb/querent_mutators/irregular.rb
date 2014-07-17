#encoding: UTF-8
require_relative 'irregular/json_deserializer'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            attr_reader :querent

            def initialize(lookup_string, passive_perfect_participle)
              @lookup_string = lookup_string
              @passive_perfect_participle = passive_perfect_participle
              @querent = LatinVerb::IrregularQuerent.new
              @structure = JsonDeserializer.new(@lookup_string).revivified_data_structure
              build_tense_blocks!
            end

            def build_tense_blocks!
              @structure['tense_blocks'].each_pair do |tense_block_name, serialized_tense_block|
                @querent.singleton_class.class_eval do
                  define_method tense_block_name.to_sym do
                    TenseBlock.new serialized_tense_block["data"], { :meaning => MEANINGS[tense_block_name.to_sym] }
                  end
                end
              end
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
              OpenStruct.new(add_supine(@structure['participles']['data']))
            end

            def add_supine(hash)
              accusative_supine =  hash["perfect_passive_participle"].split(/\s+/).first
              return hash unless accusative_supine
              accusative_supine.sub!(/s\z/,'m')
              ablative_supine = accusative_supine.sub( /^(.*)u(m)$/, "\\1" )
              ablative_supine += "ū"
              hash[:supine] = {:ablative => ablative_supine, :accusative => accusative_supine}
              return hash
            end
          end
        end
      end
    end
  end
end
