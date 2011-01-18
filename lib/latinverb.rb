# encoding: UTF-8
#------------------------------------------------------------------------------ 
# DEPENDENCIES
#------------------------------------------------------------------------------ 
# External dependencies
require 'verbvector'

# Internal dependencies
require 'latinverb/latinverb_validation'
require 'latinverb/latinverb_classification_types'
require 'latinverb/latinverb_errors'


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
        include Linguistics::Latin::Verb::Errors
        
   
        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string
        
        # Attributes for storing calculated status.
        attr_reader :classification, :classification_error, :principal_parts, :four_pp, :irregular, :stem

        # Access the Module that provides all the methods
        attr_reader :method_extension_module, :extending_module

        alias_method :conjugation, :classification
        alias_method :irregular?, :irregular

        def initialize(s)
          if s.class == Array
          elsif s.class == String
            # Store the original input
            @original_string = s
            @classification_error = nil

            # pre-validate the string
            self.valid?

            # Derive from the original, valid string useful specifiers in handy data structures
            @principal_parts      
            @first_pers_singular, 
            @pres_act_inf, 
            @first_pers_perf, 
            @pass_perf_part       = @four_pp = @principal_parts = s.split(/\s+/)
            # Import the vectors of all the availabe methods

            # Get all the methods that a LatinVerb must be able to respond to
            @method_extension_module = 
            Lingustics::Verbs::Verbvector::VerbvectorGenerator.new do
               language :Latin do
                 all_vectors :start_with do
                    {
                     :voice =>  %w(active passive),
                     :mood  =>  %w(indicative subjunctive imperative)
                    }
                 end
                 vectors_that /.*_indicative_mood/ do
                   {
                     :tense  => %w(present imperfect future
                                   perfect pastperfect futureperfect)
                   }
                 end
                 vectors_that /.*_subjunctive_mood/ do
                   {
                     :tense => %w(present imperfect 
                                   perfect pastperfect)
                   }
                 end
                 vectors_that /.*_imperative_mood/ do
                   {
                     :tense => %w(present)
                   }
                 end
                 all_vectors :end_with do
                   {
                     :number => %w(singular plural),
                     :person => %w(first second third)
                   }
                 end
                 exception :remove, :passive_voice_imperative_mood_present_tense
                 cluster_on :tense, "as method", :tense_list
               end
             end
          end
          @extending_module = @method_extension_module.create_module
          self.extend @extending_module

        end

        ######################################################################
        # Instance methods
        ######################################################################

        # Reaturns the "short" version, sans the module specifier
        def short_class
          return @classification.to_s.gsub(/.*::(\w+)$/,"\\1")
        end

        def to_s
           @four_pp.join(', ') + " [#{@irregular.to_s}]"
        end

      end
    end
  end
end
