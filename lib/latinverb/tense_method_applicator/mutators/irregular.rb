module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Irregular
            class Revivifier
              def initialize(verb, structure)
                @verb = verb
                @structure = structure
                build_tense_blocks!
                build_infinitives!
                build_participles!
              end

              private

              def build_tense_blocks!
                @structure['tense_blocks'].each_pair do |tense_block_name, serialized_tense_block|
                  @verb.singleton_class.class_eval do
                    define_method tense_block_name.to_sym do
                      TenseBlock.new serialized_tense_block["data"], { :meaning => MEANINGS[tense_block_name.to_sym] }
                    end
                  end
                end
              end

              def build_infinitives!
                irregular_infinitives = @structure['infinitives']['data']
                return if irregular_infinitives.nil?
                InfinitivesBuilder.new(@verb, irregular_infinitives)
              end

              def build_participles!
                irregular_participles = @structure['participles']['data']
                return if irregular_participles.nil?
                ParticiplesBuilder.new(@verb, irregular_participles)
              end
            end
            def initialize(verb)
              @verb = verb
              @deserializer = Deserializer.new(@verb)
            end

            def mutate!
              Revivifier.new(@verb, @deserializer.revivified_data_structure)
              PresentOnlyIrregularMask.new(@verb).apply!
            end
          end
        end
      end
    end
  end
end
