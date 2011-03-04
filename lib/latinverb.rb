# encoding: UTF-8
#------------------------------------------------------------------------------ 
# DEPENDENCIES
#------------------------------------------------------------------------------ 
# External dependencies
require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'

# Internal dependencies
require 'latinverb/latinverb_validation'
require 'latinverb/latinverb_classmethods'
require 'latinverb/latinverb_classification_types'
require 'latinverb/latinverb_errors'
require 'latinverb/latinverb_metaprogramming'
require 'latinverb/latinverb_constants'
require 'latinverb/latinverb_tense_methods'
require 'latinverb/latinverb_phonographia'
require 'latinverb/latinverb_particip_and_inf'
require 'latinverb/latinverb_display'
require 'latinverb/latinverb_data'
require 'latinverb/latinverb_irregulars'

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
        include Linguistics::Latin::Verb::ParticiplesAndInfinitives
 
        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string
        
        # Attributes for storing calculated status.
        attr_reader :classification, :classification_error, :principal_parts,
        :four_pp, :irregular, :stem, :first_pers_singular, :pres_act_inf,
        :first_pers_perf, :pass_perf_part, :participial_stem, :verb_methods,
        :data_structure

        # Access the Module that provides all the methods
        attr_reader :latin_verbvector_generator, :latin_verb_methods

        alias_method :conjugation, :classification
        alias_method :irregular?, :irregular

        def initialize(s)
          raise SyntaxError if s.nil?

          if s.class == String
            _init_by_string(s)
            _irregular_handler if @irregular
          end

          if (s.class == Hash )
            if (s['irregular'] == false and 
                s.has_key?('original_string'))
              # We're restoring a standard verb
              _init_by_string(s['original_string'])
            end
          end

          if s.class == Array
            # TODO:  Fill this out.  
          end
          
          # Load up the specialized vector complement of methods
          _add_vector_methods

          # Given the use of method_missing to handle resolution, it's wise to
          # make sure that every cluster method /is/ actually defined.
          @tense_list.each do |m|
            raise "FAILURE:  Critical method #{m} was not defined." unless 
              (self.respond_to? m.to_sym)
          end

          # Placeholder the data structure that holds all the answers (a hash
          # of TenseBlocks).  This may be the typical case, but the
          # calculation is an expensive operation compared to the simple
          # vector query, so this won't actually get defined unless #to_hash
          # is called (cf. latinverb/display).
          # TODO:  This probably needs some work, make it useful in the
          # to_json methods

          @data_structure = {}

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

        private

        def _irregular_handler
          begin
            o = @original_string.gsub(/\s+/,'_')
            json_string = Linguistics::Latin::Verb.const_get( 
               ActiveSupport::Multibyte::Chars.new( o ).upcase.to_sym)
             revivified_data_structure = JSON.parse json_string
             revivified_data_structure['tense_blocks'].each_pair do |k,v|
               self.class.class_eval do
                 define_method k.to_sym do
                   return v
                 end
               end
             end
          rescue JSON::ParserError => e
            puts "We were unable to parse JSON for #{@original_string}.  Please verify your syntax."
            raise e
            exit
          rescue NameError => e
            puts "We were unable to find a definition for #{@original_string}/#{o}.  Please provide one."
            raise e
            exit
          rescue => error
            warn "#{@original_string} was identified as irregular but did not have a definition provided."
            raise error
          end
        end

        def _init_by_string(s)
          # Store the original input
          @original_string = s
          @classification_error = nil

          # pre-validate the string
          self.valid?
          
          # If the error callback has been created, then call it
          @classification_error.call unless @classification_error.nil?

          # Derive from the original, valid string useful specifiers in handy data structures
          _derive_parts_from_given_string s
       
          # Derive iVar from derived variables
          @participial_stem ||= calculate_participial_stem


        end

        def _add_vector_methods
          # Get all the methods that a LatinVerb must be able to respond to
          @latin_verbvector_generator = 
          Linguistics::Verbs::Verbvector::VerbvectorGenerator.new do
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

          # This provides methods of the form #{language_name}_#{fake_name}.
          # They are actually called sans #{language_name} so that
          # method_missing is called.
          @verb_methods = @latin_verbvector_generator.method_extension_module

          # Make sure all the cluster methods are defined.  Ensure we don't
          # get infinite stack method_missing lookups
          @tense_list = 
            @latin_verbvector_generator.cluster_methods[:tense_list].call

          # POWER-UP with the vector methods
          self.extend @verb_methods
        end

        def _derive_parts_from_given_string(s)
            @principal_parts      
            @first_pers_singular, 
            @pres_act_inf, 
            @first_pers_perf, 
            @pass_perf_part       = @four_pp = @principal_parts = s.split(/\s+/)
        end

        def calculate_participial_stem
           raise("@pres_act_inf was nil!") if  
             @pres_act_inf.nil? or @first_pers_singular.nil?

           if @pres_act_inf.to_s =~ /(.*ā)re$/
            return $1
          end 

          if @pres_act_inf.to_s =~ /(.*ē)re$/
            return $1
          end        

          if @pres_act_inf.to_s =~ /(.*)ere$/
            match=$1
            if @first_pers_singular =~ /iō/
              return match + "iē"  
            else
              return match + "e" 
            end       end 
        
          if @pres_act_inf.to_s =~ /(.*)īre$/
            return $1 + "iē" 
          end 
        end 


      end
    end
  end
end
