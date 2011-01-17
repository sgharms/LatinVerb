module Linguistics
  module Latin
    module Verb
      module Validation
        def valid?
          os = @original_string
          self.instance_eval do
             self.class.classify os
          end
            
          # If classify fails, it raises a RuntimeError.  It returns true otherwise.
          return true
        end
      end
    end
  end
end

