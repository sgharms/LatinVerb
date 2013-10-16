module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def to_hash
          tense_list.inject({'original_string' => @original_string}) do |memo, tense_block_identifier|
            ts = tense_block_identifier.to_sym
            memo[ts] = self.send(ts)
            memo
          end
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
