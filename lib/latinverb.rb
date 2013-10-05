require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'

require 'linguistics/latin/verb/classification_types'
require 'linguistics/latin/verb/verb_types'
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
require 'linguistics/latin/verb/latinverb/tense_method_applicator'
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

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        extend Forwardable

        def_delegators :@validator, :valid?
        def_delegators :@classifier, :classification, :irregular?, :present_only?, :regular?, :set_as_defective, :short_class
        def_delegators :@prin_parts_extractor, :first_person_perfect, :first_person_perfect, :first_person_singular, :participial_stem, :passive_perfect_participle, :present_active_infinitive, :present_active_infinitive, :principal_parts, :stem 
        def_delegators :@participler, :future_active_participle, :future_passive_participle, :gerund, :gerundive, :perfect_passive_participle, :present_active_participle
        def_delegators :@infinitivizer, :future_active_infinitive, :future_passive_infinitive, :infinitives, :perfect_active_infinitive, :perfect_passive_infinitive, :present_passive_infinitive
        def_delegators :@chart_presenter, :chart, :c

        def_delegator :@latin_verbvector_generator, :vector_list, :instance_methods
        def_delegator :@verb_type, :inspect, :verb_type
        def_delegator :@classifier, :to_s, :conjugation
        def_delegator :@classifier, :dup, :classified_as

        attr_reader :original_string, :verb_methods, :latin_verbvector_generator
        attr_accessor :tense_list

        def initialize(data)
          @original_string = (data['original_string'] || data).to_s
          @classifier = LatinVerbClassifier.new(@original_string)
          @prin_parts_extractor = LatinVerbPPExtractor.new(@original_string, @classifier)
          @verb_type = LatinVerbTypeEvaluator.new(first_person_singular, present_active_infinitive, @classifier)
          @validator = Linguistics::Latin::Verb::Validator.new(self)
          @participler = Linguistics::Latin::Verb::Participler.new(self)
          @infinitivizer = Linguistics::Latin::Verb::Infinitivizer.new(self)
          @chart_presenter = Linguistics::Latin::Verb::ChartPresenter.new(self)
          @latin_verbvector_generator = Linguistics::Verbs::Verbvector::VectorApplicator.new(self).latin_verbvector_generator
          TenseMethodApplicator.new(self)
        end

        def to_s
          sprintf("%s [%s]", short_class, original_string)
        end
      end
    end
  end
end
