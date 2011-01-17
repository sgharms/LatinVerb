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
        
        # Attributes for storing calculated status.
        attr_reader :classification, :principal_parts, :four_pp, :irregular

        def initialize(s)
          if s.class == Array
          elsif s.class == String
            # Store the original input
            @original_string = s

            # Derive from the original, valid string useful specifiers in handy data structures
            @principal_parts = s.split /\s+/
            @first_pers_singular, @pres_act_inf, 
            @first_pers_perf, @pass_perf_part = @principal_parts
            @four_pp = @principal_parts

            # Quick means for irregularity check
            @irregular = self.irregular? @four_pp
          end
        end

        ######################################################################
        # Instance methods
        ######################################################################

        # Reaturns the "short" version, sans the module specifier
        def short_class
          return @classification.to_s.gsub(/.*::(\w+)$/,"\\1")
        end


      end
    end
  end
end
