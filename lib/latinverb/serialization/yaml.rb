require 'yaml'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def to_yaml
          to_hash.to_yaml
        end

        alias_method :to_y, :to_yaml
      end
    end
  end
end
