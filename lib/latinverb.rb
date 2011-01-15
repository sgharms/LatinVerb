# Generalized module for handling lingustics processing
module Lingustics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      # Class that is used to model a Verb in Latin
      class LatinVerb
        def initialize
          puts "this is a #{self.class}"
        end
      end
    end
  end
end
