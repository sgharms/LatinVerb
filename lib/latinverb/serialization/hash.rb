module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def to_hash
          TENSE_BLOCK_NAMES.each_with_object(base_structure) do |tense_block_identifier, memo|
            memo[ts = (tense_block_identifier.to_sym)] = self.send(ts)
          end
        end

        alias_method :to_h, :to_hash

        private

        def base_structure
          { 'original_string' => @original_string }
        end
      end
    end
  end
end
