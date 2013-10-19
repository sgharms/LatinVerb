require 'active_support'
require 'forwardable'
require 'json'
require 'ostruct'
require 'yaml'
require 'byebug'

require 'linguistics/latin/phonographia'
require 'linguistics/latin/verb'

require 'latinverb/errors'
require 'latinverb/components'
require 'latinverb/tense_block'
require 'latinverb/imperative_block'
require 'latinverb/serialization'
require 'latinverb/version'
require 'latinverb/dynamic_method_resolver'
require 'latinverb/tense_method_applicator'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        extend Forwardable

        def_delegators :@validator, :valid?
        def_delegators :@classifier, :classification, :irregular?, :present_only?, :regular?, :set_as_defective, :short_class
        def_delegators :@prin_parts_extractor, :first_person_perfect, :first_person_perfect, :first_person_singular, :participial_stem, :passive_perfect_participle, :present_active_infinitive, :present_active_infinitive, :principal_parts, :stem 
        def_delegators :@participler, :supine, :future_active_participle, :future_passive_participle, :gerund, :gerundive, :perfect_passive_participle, :present_active_participle
        def_delegators :@infinitivizer, :future_active_infinitive, :future_passive_infinitive, :infinitives, :perfect_active_infinitive, :perfect_passive_infinitive, :present_passive_infinitive
        def_delegators :@chart_presenter, :chart, :c
        def_delegator  :@imperative_handler, :imperatives

        def_delegator :@classifier, :to_s, :conjugation
        def_delegator :@classifier, :dup, :classified_as
        def_delegator :@classifier, :dup, :classified_as
        def_delegator :@type_evaluator, :type, :verb_type

        attr_reader :original_string, :verb_methods, :classifier
        attr_accessor :tense_list

        def initialize(data)
          classify(data)
          build_validator
          apply_parts_of_speech!
          apply_tenses!
          apply_chart_capabilities!
        end

        def tense_list
          methods.grep(/tense\z/)
        end

        def to_s
          sprintf("%s [%s]", short_class, original_string)
        end

        def display
          pretty_generate
        end

        private

        def classify(data)
          @original_string = (data['original_string'] || data)
          @classifier = LatinVerbClassifier.new(@original_string)
          @prin_parts_extractor = LatinVerbPrincipalPartsExtractor.new(@original_string, @classifier)
          @stem_deriver = LatinverbStemDeriver.new(self)
        end

        def build_validator
          @validator = Validator.new(self)
        end

        def apply_parts_of_speech!
          @type_evaluator = LatinVerbTypeEvaluator.new(self)
          @participler = Participler.new(self)
          @infinitivizer = Infinitivizer.new(self)
          @imperative_handler = ImperativesHandler.new(self)
        end

        def apply_chart_capabilities!
          @chart_presenter = ChartPresenter.new(self)
        end

        def apply_tenses!
          TenseMethodApplicator.new(self)
        end
      end
    end
  end
end
