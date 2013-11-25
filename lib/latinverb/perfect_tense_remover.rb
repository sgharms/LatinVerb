module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentPerfectTenseRemover
          def initialize(perfect_tense_block_bearer)
            @perfect_tense_block_bearer = perfect_tense_block_bearer
          end

          def remove!
            tense_blocks_to_eclipse =
              @perfect_tense_block_bearer.methods.grep( /^(active|passive).*(_|past|future)perfect_/ )

            tense_blocks_to_eclipse.each do |s|
              @perfect_tense_block_bearer.singleton_class.class_eval do
                define_method s do
                  return NullTenseBlock.new
                end
              end
            end
          end
        end
      end
    end
  end
end
