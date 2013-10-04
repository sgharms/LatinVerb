require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'

require 'linguistics/latin/verb/classification_types'
require 'linguistics/latin/verb/tense_block'
require 'linguistics/latin/verb/null_tense_block'
require 'linguistics/latin/verb/participle_block'
require 'linguistics/latin/verb/infinitive_block'
require 'linguistics/latin/verb/imperative_block'
require 'linguistics/latin/verb/tense_definitions/impersonal'
require 'linguistics/latin/verb/tense_definitions/invariant'
require 'linguistics/latin/verb/tense_definitions/first'
require 'linguistics/latin/verb/tense_definitions/second'
require 'linguistics/latin/verb/tense_definitions/third'
require 'linguistics/latin/verb/tense_definitions/third_io'
require 'linguistics/latin/verb/tense_definitions/fourth'
require 'linguistics/latin/verb/tense_definitions/irregular'
require 'linguistics/latin/verb/deponent_tense_methods'
require 'linguistics/latin/verb/supine'
require 'linguistics/latin/verb/phonographia'
require 'linguistics/latin/verb/constants'
require 'linguistics/latin/verb/infinitives'
require 'linguistics/latin/verb/participles'
require 'linguistics/latin/verb/irregulars'

require 'linguistics/latin/verb/latinverb/impersonal'
require 'linguistics/latin/verb/latinverb/irregular'
require 'linguistics/latin/verb/latinverb/semideponent'
require 'linguistics/latin/verb/latinverb/deponent'
require 'linguistics/latin/verb/latinverb/latinverb_classifier'
require 'linguistics/latin/verb/latinverb/latinverb_pp_extractor'
require 'linguistics/latin/verb/latinverb/defective_checker'
require 'linguistics/latin/verb/latinverb/latin_verb_type_evaluator'
require 'linguistics/latin/verb/latinverb/classmethods'
require 'linguistics/latin/verb/latinverb/verbvector_description'
require 'linguistics/latin/verb/latinverb/metaprogramming'
require 'linguistics/latin/verb/latinverb/validation'
require 'linguistics/latin/verb/latinverb/data'
require 'linguistics/latin/verb/latinverb/display'
require 'latinverb/version'
require 'latinverb/presenter'


module Linguistics
  module Latin
    module Verb
      class LatinVerb
        extend Forwardable

        def_delegators :@validator, :valid?
        def_delegators :@classifier, :present_only?, :regular?, :irregular?, :classification, :short_class
        def_delegators :@prin_parts_extractor, :passive_perfect_participle, :first_person_perfect, :present_active_infinitive, :stem, :principal_parts, :first_person_singular, :participial_stem, :first_person_perfect, :present_active_infinitive #:passive_perfect_participle, 

        def_delegator :@latin_verbvector_generator, :vector_list, :instance_methods
        def_delegator :@verb_type, :inspect, :verb_type
        def_delegator :@classifier, :to_s, :conjugation


        include Linguistics::Latin::Verb::Participles
        include Linguistics::Latin::Verb::Infinitives
        include Linguistics::Latin::Verb::LatinVerbPresenter

        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string

        # Attributes for storing calculated status.
        attr_reader :verb_methods

        # Access the Module that provides all the methods
        attr_reader :latin_verbvector_generator

        def initialize(data)# {{{
          raise LatinVerbInitializationError if data.nil?
          calculate_verb_vector_methods

          data = data['original_string'] if init_data_is_a_hash_of_a_regular_restorable_verb(data)

          if data.is_a? String
            @sanitizer            = data
            @original_string      = @sanitizer.to_s
            @classifier           = LatinVerbClassifier.new @original_string
            @prin_parts_extractor = LatinVerbPPExtractor.new @sanitizer.to_s, @classifier
            @verb_type            = LatinVerbTypeEvaluator.new first_person_singular, present_active_infinitive, @classifier

            load_tense_methods
            generate_methods_for_accessing_tense_blocks_from_tense_methods_components
            include_classification_specific_mixins
            check_and_mutate_defectives
          end
          @validator = Linguistics::Latin::Verb::Validator.new(self)
        end# }}}

        def to_s
          return sprintf("%s [%s]", short_class, original_string)
        end

      def classified_as
        return @classifier
      end

     private

      def calculate_verb_vector_methods
        @latin_verbvector_generator =
          Linguistics::Verbs::Verbvector::VerbvectorGenerator.new(
            &Linguistics::Latin::Verb::LatinVerb::LATIN_VERBVECTOR_DESCRIPTION )
      end

     def load_tense_methods
       load_tense_methods_that_do_not_vary_by_verb_type
       load_tense_methods_based_on_verb_type
     end

     def load_tense_methods_that_do_not_vary_by_verb_type
       self.extend Linguistics::Latin::Verb::TenseDefinitions::Invariant
     end

     def load_tense_methods_based_on_verb_type
       mod_path = @verb_type.inspect.to_s
       return if mod_path.empty?
       mod_path.sub!('VerbTypes', 'TenseDefinitions' )
       the_mod = mod_path.split('::').inject(Object) do |mod, class_name|
         mod.const_get(class_name)
       end
       self.extend the_mod
     end

     def verify_generated_tense_list
       @tense_list.each do |m|
         raise "FAILURE:  Critical method #{m} was not defined." unless
           (self.respond_to? m.to_sym)
       end
     end

      def init_data_is_a_hash_of_a_regular_restorable_verb(data)
        (data.respond_to?(:each) && !data['irregular'] && data.has_key?('original_string'))
      end

      def generate_methods_for_accessing_tense_blocks_from_tense_methods_components
        self.extend @latin_verbvector_generator.method_extension_module
        @tense_list = @latin_verbvector_generator.cluster_methods[:tense_list].call
        verify_generated_tense_list
      end

        def include_classification_specific_mixins
          the_mod = if classified_as.impersonal?
             Linguistics::Latin::Verb::LatinVerb::Impersonal
          elsif classified_as.irregular?
             Linguistics::Latin::Verb::LatinVerb::Irregular
          elsif  classified_as.deponent?
             Linguistics::Latin::Verb::LatinVerb::Deponent
          elsif classified_as.semideponent?
             Linguistics::Latin::Verb::LatinVerb::Semideponent
          elsif classified_as.present_only?
             Linguistics::Latin::Verb::LatinVerb::PresentOnly
          end

          return unless the_mod

          self.instance_eval do
            self.extend the_mod
          end

        end

      def check_and_mutate_defectives
        is_defective = Linguistics::Latin::Verb::LatinVerb::DefectiveChecker::is_it_defective?(self)
        if is_defective
          @classifier.set_as_defective
          remove_perfect_tenses
        end
      end

      def remove_perfect_tenses
        tense_blocks_to_eclipse =
          self.methods.grep( /^(active|passive).*(_|past|future)perfect_/ )

        tense_blocks_to_eclipse.each do |s|
          singleton_class.class_eval do
            define_method s do
              return NullTenseBlock.new
            end
          end
        end
      end
      end
    end
  end
end
