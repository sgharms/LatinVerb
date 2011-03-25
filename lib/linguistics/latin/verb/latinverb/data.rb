# encoding: UTF-8
require 'json'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        ##
        #
        # Required method for JSON deserialization
        #
        ##
        def self.json_create(o)
          new( o )
        end
        
        ##  
        #
        # Presents the LatinVerb expressed as a hash with the names of the TenseBlock
        # specifiers as keys, and corresponding TenseBlock objects, converted to
        # Arrays, as the values.  It also contains the +original_string+.
        #
        ##
        def to_hash 
          @tense_list.each do |t|
            ts = t.to_sym
            @data_structure[ts]=self.send ts
          end
          @data_structure['original_string'] = @original_string
          return @data_structure
        end

        alias_method :to_h, :to_hash

        ##
        #
        # Takes the hash that results from to_hash and then converts it to
        # YAML.
        #
        ## 
        def to_yaml
          @data_structure.empty? ?
            to_hash.to_yaml:
            @data_structure.to_yaml
        end

        alias_method :to_y, :to_yaml

        ##
        #
        # Required method for JSON deserialization
        #
        ##
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
            @tense_list.each do |t|
              json_hash['tense_list'][t.to_s] = self.send t.to_sym 
            end
            json_hash['irregular']    = irregular?
            return json_hash.to_json(*a)
          end
        end

        ##
        #
        # Dumps the LatinVerb as pretty JSON
        #
        ##
        def pretty_generate
          JSON.pretty_generate(@data_structure.keys.length < 1 ? to_hash : @data_structure)
        end

      end
    end
  end
end
