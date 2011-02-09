module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def to_hash
          @tense_list.each do |t|
            ts = t.to_sym
            @data_structure[ts]=self.send ts
          end
          return @data_structure
        end
        def to_yaml
          @data_structure.empty? ?
            to_hash.to_yaml:
            @data_structure.to_yaml
        end
        alias_method :to_y, :to_yaml
        def to_json
          @data_structure.empty? ?
            to_hash.to_json:
            @data_structure.to_json
        end
        def pretty_generate
          JSON.pretty_generate(@data_structure.keys.length < 1 ? to_hash : @data_structure)
        end
      end
    end
  end
end
