# encoding: UTF-8
require 'latinverb/latinverb_errors'

module Linguistics
  module Latin
    module Verb
      module Validation
        def valid?
          os = @original_string

          self.instance_eval do
            begin
              @classification = self.class.classify os
              @irregular = false 
              @stem ||= self.class.calculate_stem os.split(/\s+/)[1]
            rescue Exception => detail
              @irregular = true 
              @classification_error = lambda do
                raise detail
              end
            end
          end
          return true
        end
      end
    end
  end
end

