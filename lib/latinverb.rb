require 'active_support'
require 'forwardable'

require 'linguistics_latin'

require 'latinverb/errors'
require 'latinverb/components' # TODO:  components and components again later, need differentiating names
require 'latinverb/defective_checker'
require 'latinverb/formatters/triplicate_and_pluralize_formatters'
require 'latinverb/tense_block'
require 'latinverb/imperative_block'
require 'latinverb/serialization'
require 'latinverb/version'
require 'latinverb/dynamic_method_resolver'
require 'latinverb/querent'
require 'latinverb/querent/first'
require 'latinverb/querent/second'
require 'latinverb/querent/third'
require 'latinverb/querent/third_io'
require 'latinverb/querent/fourth'
require 'latinverb/querent/irregular'
require 'latinverb/querent_factory'
require 'latinverb/querent_mutators/deponent'
require 'latinverb/querent_mutators/irregular'
require 'latinverb/querent_mutators/semideponent'
require 'latinverb/querent_tense_methods_vectorizer'
require 'latinverb/tense_block/null_tense_block'
require 'latinverb/perfect_tense_remover'
require 'latinverb/querent_for_classification_builder'
require 'latinverb/irregular_components_builder'
require 'latinverb/components_factory'


module Linguistics
  module Latin
    module Verb
      class LatinVerb
        extend Forwardable

        def_delegators :@validator, :valid?
        def_delegators :@classifier, :classification, :irregular?, :present_only?, :regular?, :set_as_defective, :short_class, :deponent?, :semideponent?
        def_delegators :@prin_parts_extractor, :first_person_perfect, :first_person_perfect, :first_person_singular, :passive_perfect_participle, :present_active_infinitive, :present_active_infinitive, :principal_parts
        def_delegators :@participler, :supine, :future_active_participle, :future_passive_participle, :gerund, :gerundive, :perfect_passive_participle, :present_active_participle, :perfect_active_participle
        def_delegators :@infinitivizer, :future_active_infinitive, :future_passive_infinitive, :infinitives, :perfect_active_infinitive, :perfect_passive_infinitive, :present_passive_infinitive
        def_delegators :@stem_deriver, :stem, :participial_stem
        def_delegators :@chart_presenter, :chart, :c
        def_delegator  :@imperative_handler, :imperatives

        def_delegator :@classifier, :to_s, :conjugation
        def_delegator :@classifier, :dup, :classified_as
        def_delegator :@classifier, :dup, :classified_as
        def_delegator :@type_evaluator, :type, :verb_type

        attr_reader :original_string, :verb_methods, :classifier, :querent

        def initialize(data)
          classify(data)
          build_lookup_components!
          build_validator!
          apply_chart_capabilities!
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
          @type_evaluator = LatinVerbTypeEvaluator.new(self)
        end

        def build_lookup_components!
          @querent = QuerentForClassificationBuilder.new(self).querent
          @infinitivizer, @imperative_handler, @participler = ComponentsFactory.new(self).components
        end

        def apply_chart_capabilities!
          @chart_presenter = ChartPresenter.new(self)
        end

        def build_validator!
          @validator = Validator.new(self)
        end

        def components_for_irregular
          IrregularComponentsBuilder.new(self).components
        end

        def components
          [ Infinitivizer.new(self), ImperativesHandler.new(self), Participler.new(self) ]
        end
      end
    end
  end
end

require 'latinverb/paradigmatic_verbs'
