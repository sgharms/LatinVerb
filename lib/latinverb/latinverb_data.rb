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
          return @data_structure.to_json
        end
      end
    end
  end
end
