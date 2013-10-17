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

        def_delegator :@verb_type, :inspect, :verb_type
        def_delegator :@classifier, :to_s, :conjugation
        def_delegator :@classifier, :dup, :classified_as

        attr_reader :original_string, :verb_methods, :verb_type
        attr_accessor :tense_list

        def initialize(data)
          evaluate_and_classify(data)
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

        def evaluate_and_classify(data)
          @original_string = (data['original_string'] || data).to_s
          @classifier = LatinVerbClassifier.new(@original_string)
          @prin_parts_extractor = LatinVerbPrincipalPartsExtractor.new(@original_string, @classifier)
          @verb_type = LatinVerbTypeEvaluator.new(first_person_singular, present_active_infinitive, @classifier)
        end

        def build_validator
          @validator = Validator.new(self)
        end

        def apply_parts_of_speech!
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

          def apply_final_vectors
            final_vectors = {
              0 => [ :first_person_singular_number, :singular_number_first_person ],
              1 => [ :second_person_singular_number, :singular_number_second_person ],
              2 => [ :third_person_singular_number, :singular_number_third_person ],
              3 => [ :first_person_plural_number, :plural_number_first_person ],
              4 => [ :second_person_plural_number, :plural_number_second_person ],
              5 => [ :third_person_plural_number, :plural_number_third_person ]
            }

            tense_list.each do | tense_block_method |
              final_vectors.each_pair do | tense_block_location, accessors |
                accessors.each do | accessor |
                  new_method = [tense_block_method, accessor].map(&:to_s).join('_').to_sym
                  self.singleton_class.class_eval do
                    define_method new_method, Proc.new{ self.send(tense_block_method)[tense_block_location] }
                  end
                end
              end

              self.singleton_class.class_eval do
                define_method("#{tense_block_method}_first_person", Proc.new do
                  [ self.send(tense_block_method)[0],
                    self.send(tense_block_method)[3] ]
                end)

                define_method("#{tense_block_method}_second_person", Proc.new do
                  [ self.send(tense_block_method)[1],
                    self.send(tense_block_method)[4] ]
                end)

                define_method("#{tense_block_method}_third_person", Proc.new do
                  [ self.send(tense_block_method)[2],
                    self.send(tense_block_method)[5] ]
                end)

                define_method("#{tense_block_method}_singular_number", Proc.new do
                  [ self.send(tense_block_method)[0],
                    self.send(tense_block_method)[1],
                    self.send(tense_block_method)[2] ]
                end)

                define_method("#{tense_block_method}_plural_number", Proc.new do
                  [ self.send(tense_block_method)[3],
                    self.send(tense_block_method)[4],
                    self.send(tense_block_method)[5] ]
                end)
              end
            end
          end

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
      end
    end
  end
end
