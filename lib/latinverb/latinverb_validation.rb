module Linguistics
  module Latin
    module Verb
      module Validation
        def valid?
          os = @original_string

          # If classify fails, it raises a RuntimeError.  It returns true otherwise.
          self.instance_eval do
            @classification = self.class.classify os
          end
          return true
        end
      end
    end
  end
end

