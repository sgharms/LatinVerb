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
require 'latinverb/latinverb_metaprogramming'
require 'latinverb/latinverb_tense_methods'
require 'latinverb/latinverb_constants'


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
        include Linguistics::Latin::Verb::TenseMethods
        
   
        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string
        
        # Attributes for storing calculated status.
        attr_reader :classification, :classification_error, :principal_parts, :four_pp, :irregular, :stem

        # Access the Module that provides all the methods
        attr_reader :latin_verbvector_generator, :latin_verb_methods

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
            @latin_verbvector_generator = 
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

          # This provides methods of the form #{language_name}_#{fake_name}.
          # They are actually called sans #{language_name} so that
          # method_missing is called.
          @verb_methods = @latin_verbvector_generator.method_extension_module

          # Make sure all the cluster methods are defined.  Ensure we don't
          # get infinite stack method_missing lookups
          @tense_list = @latin_verbvector_generator.cluster_methods[:tense_list].call

          # POWER-UP with the vector methods
          self.extend @verb_methods

          # Given the use of method_missing to handle resolution, it's wise to
          # make sure that every cluster method /is/ actually defined.
          @tense_list.each do |m|
            raise "FAILURE:  Critical method #{m} was not defined." unless (self.respond_to? m.to_sym)
          end

          # TODO:  
          # create module to implement the cluster methods, test not nil in the return
          # maybe create a new object, derived from the verbverctor that models the non-clustered aspects
          # mave clustered methods respond with data fitting that object type based on the rules provided
          # create a new project for handling the macron testing and abbreviation
        end

        ######################################################################
        # Instance methods
        ######################################################################

        # Reaturns the "short" version, sans the module specifier
        def short_class
          return @classification.to_s.gsub(/.*::(\w+)$/,"\\1")
        end

        def to_s
           @four_pp.join(', ') + " [Irregular?: #{@irregular.to_s}]"
        end

      end
    end
  end
end
