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
          !@original_string.nil? &&
          !classification.nil? &&
          ( irregular? ? true : !stem.nil? )
        end
      end
    end
  end
end

