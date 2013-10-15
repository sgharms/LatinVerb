require 'active_support'
require 'forwardable'
require 'json'
require 'ostruct'
require 'verbvector'
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
require 'latinverb/verbvector_description'
require 'latinverb/pluralizations_helper'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        include PluralizationsHelper

        extend Forwardable

        def_delegators :@validator, :valid?
        def_delegators :@classifier, :classification, :irregular?, :present_only?, :regular?, :set_as_defective, :short_class
        def_delegators :@prin_parts_extractor, :first_person_perfect, :first_person_perfect, :first_person_singular, :participial_stem, :passive_perfect_participle, :present_active_infinitive, :present_active_infinitive, :principal_parts, :stem 
        def_delegators :@participler, :supine, :future_active_participle, :future_passive_participle, :gerund, :gerundive, :perfect_passive_participle, :present_active_participle
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
          @validator = Validator.new(self)
          @participler = Participler.new(self)
          @infinitivizer = Infinitivizer.new(self)
          @chart_presenter = ChartPresenter.new(self)
          @latin_verbvector_generator = VectorApplicator.new(self).latin_verbvector_generator
          Mutators::Invariant.new(self)
          TenseMethodApplicator.new(self)
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
          resolver.supported_method? || super
        end

        def display
          pretty_generate
        end

          IMPERATIVE_EXCEPTIONS = {
            "ducere"   => %w(duc ducite),
            "dicere"   => %w(dic dicite),
            "facere"   => %w(fac facite),
            "ferre"    => %w(fer ferte),
            "nolere"   => %w(nolo nolite)
          }

          def imperatives
            args = exceptional_imperative? ? calculate_exceptional_imperatives : [stem, present_active_infinitive]
            Linguistics::Latin::Verb::ImperativeBlock.new(*args, self)
          end

          private

  def pluralize_participial_listing(x)
    x.sub!(/us,/,   'ī,' )
    x.sub!(/a,/,    'ae,')
    x.sub!(/um.*$/, 'a'  )
  end

  def triplicate_and_genderize(s)
    stem = s.sub(/^(.*)um$/,"\\1")
    [ stem + 'us',
      stem + 'a',
      s
    ].join(', ')
  end
          def exceptional_imperative?
            IMPERATIVE_EXCEPTIONS.has_key?(present_active_infinitive)
          end

          def calculate_exceptional_imperatives
            IMPERATIVE_EXCEPTIONS[present_active_infinitive]
          end

      end
    end
  end
end
