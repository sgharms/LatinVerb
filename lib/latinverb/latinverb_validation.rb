# encoding: UTF-8
require 'latinverb/latinverb_errors'

module Linguistics
  module Latin
    module Verb
      module Validation
        def valid?
          os = @original_string

          # If classify fails, it raises a RuntimeError.  It returns true otherwise.
          self.instance_eval do
            @classification = self.class.classify os
            @stem ||= self.class.calculate_stem os.split(/\s+/)[1]
          end
          
          raise IrregularVerbSpecificationError  if (  self.classification.nil? or
            self.stem.empty? )

          return true
        end

        def irregular?(a)
          if a[0] == 'sum'
            true
          else
            false
          end
        end
      end
    end
  end
end

