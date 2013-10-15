module Linguistics
  module Latin
    module Verb
      class LatinVerb
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
        class Validator
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
          def initialize(verb)
            @verb = verb
          end

          def valid?
            has_original_string? && has_classification? && has_stem?
          end

          private

          def has_original_string?
            !@verb.original_string.nil?
          end

          def has_classification?
            !@verb.classification.nil?
          end

          def has_stem?
            return true if @verb.irregular?
            !@verb.stem.nil?
          end

        end
      end
    end
  end
end

