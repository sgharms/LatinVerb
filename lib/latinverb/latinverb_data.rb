require 'json'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def self.json_create(o)
          new( o )
        end
        def to_hash
          @tense_list.each do |t|
            ts = t.to_sym
            @data_structure[ts]=self.send ts
          end
          return @data_structure
        end
        alias_method :to_h, :to_hash
        def to_yaml
          @data_structure.empty? ?
            to_hash.to_yaml:
            @data_structure.to_yaml
        end
        alias_method :to_y, :to_yaml
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
            # json_hash['original_string']  = original_string
            # json_hash['classification'] = classification
            # json_hash['stem'] = stem
            json_hash['tense_list' ]  = {}
            @tense_list.each do |t|
              json_hash['tense_list'][t.to_s] = self.send t.to_sym 
            end
            json_hash['irregular']    = irregular?
            return json_hash.to_json(*a)
          end

          {
            'json_class' => self.class.name,
            'revivify'    => 
              { 
                # tense_blocks => JSON string
                :tense_blocks =>
                                (@data_structure.empty? ?
                                  to_hash:
                                  @data_structure).to_json,
                :orig_string  => @original_string.to_json,

              }
           }.to_json(*a)
        end

        def pretty_generate
          JSON.pretty_generate(@data_structure.keys.length < 1 ? to_hash : @data_structure)
        end

      end
    end
  end
end
