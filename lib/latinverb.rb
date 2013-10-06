require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'
require 'forwardable'
require 'byebug'

# TODO: extract linguistics into another gem?
require 'linguistics/latin/verb'

# Good
require 'latinverb/version'
require 'latinverb/data'
require 'latinverb/components'
require 'latinverb/tense_block'

require 'latinverb/imperative_block' # can we put this part of something else?
require 'latinverb/participle_block' # can we put this part of something else?

#building
require 'latinverb/deponent_string_deriver'
require 'latinverb/semideponent'
require 'latinverb/tense_method_applicator'
require 'latinverb/tense_block'
require 'latinverb/verbvector_description'
require 'latinverb/defective_checker'
require 'latinverb/deponent_tense_methods'
require 'latinverb/display'
require 'latinverb/errors'
require 'latinverb/impersonal'
require 'latinverb/supine'
require 'latinverb/infinitive_block'
require 'latinverb/irregular'
require 'latinverb/components/vector_applicator'
require 'latinverb/dynamic_method_resolver'

require 'latinverb/deponent'
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
          @validator = Linguistics::Latin::Verb::LatinVerb::Validator.new(self)
          @participler = Linguistics::Latin::Verb::LatinVerb::Participler.new(self)
          @infinitivizer = Linguistics::Latin::Verb::LatinVerb::Infinitivizer.new(self)
          @chart_presenter = Linguistics::Latin::Verb::LatinVerb::ChartPresenter.new(self)
          TenseMethodApplicator.new(self)
          @latin_verbvector_generator = Linguistics::Latin::Verb::LatinVerb::VectorApplicator.new(self).latin_verbvector_generator
        end

        def to_s
          sprintf("%s [%s]", short_class, original_string)
        end

        def method_missing(method_name, *args )
          resolver = DynamicMethodResolver.new(self, method_name)
          resolver.apply! || super
        end

        def respond_to_missing?(method_name, include_private = false)
          resolver = DynamicMethodResolver.new(self, method_name)
          resolver.valid? || super
        end
      end
    end
  end
end
