# encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      ##
      # == NAME 
      #
      # Validation
      #
      # == DESCRIPTION
      #
      # This module contains the validity testing methods, when mixed into a
      # LatinVerb, will provide it the ability to ensure its own sanity.
      #
      ##
      module Validation

        ##
        #
        # == DESCRIPTION
        #
        # This performs the basic task of evaluating the given string (cf.
        # LatinVerb.initialize) for basic sanity.
        #
        # Here are its basic truths
        # 
        # 1.  Get +@original_string+ as an iVar
        # 1.  Derive a classification (+@classification+) from the string
        # 1.  Determine whether the string qualifies the verb as irregular
        # 1.  Identify a stem (+@stem+), provided the verb is regular
        #
        ##
        def valid?
          os = @original_string
          instance_eval do
            begin
              @classification = Linguistics::Latin::Verb::LatinVerb.classify(os)
              @irregular = 
                @classification == Linguistics::Latin::Verb::VerbTypes::Irregular ?
                true : false
              unless @irregular
                @stem ||= self.class.calculate_stem os.split(/\s+/)[1]
              @deponent = (@classification == Linguistics::Latin::Verb::VerbTypes::Deponent) ?
                true : false
              @semideponent = (@classification == Linguistics::Latin::Verb::VerbTypes::Semideponent) ?
                true : false
              end
            rescue Linguistics::Latin::Verb::Errors::IrregularVerbSpecificationError => detail
              STDERR.puts "WARNING:  Improper use of rescue for decision structure in latinverb_validation"
              @irregular = true 
            rescue Exception => e
              @classification_error = lambda do
                raise e
              end
            end
          end
          return true
        end
      end
    end
  end
end

