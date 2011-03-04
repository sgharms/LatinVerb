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
              @classification = Linguistics::Latin::Verb::LatinVerb.classify(os)
              @irregular = 
                @classification == Linguistics::Latin::Verb::VerbTypes::Irregular ?
                true : false
              unless @irregular
                @stem ||= self.class.calculate_stem os.split(/\s+/)[1]
              end
            rescue Linguistics::Latin::Verb::Errors::IrregularVerbSpecificationError => detail
              STDERR.puts "WARNING:  Improper use of rescue for decision structure in latinverb_validation"
              @irregular = true 
            rescue Exception => detail
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

