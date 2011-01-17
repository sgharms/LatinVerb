require 'latinverb/latinverb_validation'
require 'latinverb/latinverb_classification_types'


# Generalized module for handling lingustics processing
module Linguistics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      
      # Class that is used to model a Verb in Latin
      class LatinVerb
        # Modules used to validate the input in initialize
        include Linguistics::Latin::Verb::Validation
        
   
        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string

        def initialize(s)
          if s.class == Array
          elsif s.class == String
            @original_string = s
          end
        end

      end
    end
  end
end
