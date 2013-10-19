module Linguistics
  module Latin
    module Verb
      module Classification
        class ClassificationType
          def self.short_name
            self.to_s.split('::').last
          end

          def self.short_name_key
            short_name.to_sym
          end
        end
      end
    end
  end
end

require_relative './classification_type/defective'
require_relative './classification_type/deponent'
require_relative './classification_type/impersonal'
require_relative './classification_type/irregular'
require_relative './classification_type/present_only'
require_relative './classification_type/regular'
require_relative './classification_type/semideponent'
