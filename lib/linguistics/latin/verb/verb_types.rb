module Linguistics
  module Latin
    module Verb
      module VerbTypes
        class VerbType
          def self.ordinal_name
            self.to_s.split('::').last
          end

          def self.ordinal_name_key
            ordinal_name.to_sym
          end
        end
      end
    end
  end
end

require_relative './verb_types/first'
require_relative './verb_types/second'
require_relative './verb_types/third'
require_relative './verb_types/third_io'
require_relative './verb_types/fourth'
require_relative './verb_types/irregular'
