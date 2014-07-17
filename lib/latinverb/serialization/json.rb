module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def self.json_create(o)
          new(o)
        end

        def to_json(*a)
          json_hash = {'json_class' => self.class.name}

          # In the case that we're working with a regular verb, the only thing
          # we need to save is the original string, since everything can be
          # re-derived from it easily.
          unless self.irregular?
            # While this single string is sufficient to freeze and revivifty
            # the verb, it means that the JSON structure is rather vacuous.
            # Given this, the hash is enriched so that the JSON data is
            # useful.  Nevertheless, in the revivification process, only
            # 'orig_string' is used.
            %w{original_string classification stem}.each do |k|
              json_hash[k] = self.send k.to_sym
            end
            json_hash['tense_list' ]  = {}
            LatinVerb::TENSE_BLOCK_NAMES.each do |t|
              json_hash['tense_list'][t.to_s] = self.querent.send t.to_sym
            end
            json_hash['irregular']    = irregular?
            return json_hash.to_json(*a)
          end
        end
      end
    end
  end
end
