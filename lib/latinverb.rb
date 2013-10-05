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
require 'linguistics/latin/verb/latinverb/infinitivizer'
require 'linguistics/latin/verb/latinverb/chart_presenter'
require 'linguistics/latin/verb/irregulars'

require 'linguistics/verbs/verbvector/vector_applicator'

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
require 'linguistics/latin/verb/latinverb/participler'
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
        def_delegators :@participler, :present_active_participle, :future_active_participle, :perfect_passive_participle, :future_passive_participle, :gerundive, :gerund
        def_delegators :@infinitivizer, :infinitives, :perfect_active_infinitive, :future_active_infinitive, :present_passive_infinitive, :perfect_passive_infinitive, :future_passive_infinitive
        def_delegators :@chart_presenter, :chart, :c

        def_delegator :@latin_verbvector_generator, :vector_list, :instance_methods
        def_delegator :@verb_type, :inspect, :verb_type
        def_delegator :@classifier, :to_s, :conjugation
        def_delegator :@classifier, :dup, :classified_as

        attr_reader :original_string, :verb_methods, :latin_verbvector_generator
        attr_accessor :tense_list

        def initialize(data)
          @original_string = derive_original_string(data)
          build_delegates

          acquire_vector_methods!

          calculate_verb_vector_methods
          load_tense_methods
          include_classification_specific_mixins
          check_and_mutate_defectives
        end

        def to_s
          sprintf("%s [%s]", short_class, original_string)
        end

       private

       def derive_original_string(data)
         (data['original_string'] || data).to_s
       end

       def build_delegates
          @classifier           = LatinVerbClassifier.new @original_string
          @prin_parts_extractor = LatinVerbPPExtractor.new @original_string, @classifier
          @verb_type            = LatinVerbTypeEvaluator.new first_person_singular, present_active_infinitive, @classifier
          @validator = Linguistics::Latin::Verb::Validator.new(self)
          @participler = Linguistics::Latin::Verb::Participler.new(self)
          @infinitivizer = Linguistics::Latin::Verb::Infinitivizer.new(self)
          @chart_presenter = Linguistics::Latin::Verb::ChartPresenter.new(self)
       end

       def acquire_vector_methods!
         @latin_verbvector_applicator = Linguistics::Verbs::Verbvector::VectorApplicator.new(self)
       end

       def calculate_verb_vector_methods
         @latin_verbvector_generator = @latin_verbvector_applicator.latin_verbvector_generator
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
