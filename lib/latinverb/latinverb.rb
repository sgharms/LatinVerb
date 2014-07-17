module Linguistics
  module Latin
    module Verb
      class LatinVerb
        extend Forwardable

        attr_reader :original_string, :querent, :options

        def initialize(data, options = {})
          @options = options
          @original_string = (data['original_string'] || data)
          @prin_parts_extractor = PrincipalPartsExtractor.new(@original_string)
          @classifier = Classifier.new(self)
          @stem_deriver = StemDeriver.new(self)
          @type_evaluator = TypeEvaluator.new(self)
          @validator = Validator.new(self)
          @querent = QuerentForClassificationBuilder.new(self).querent
          @infinitivizer = InfinitivesFactory.new(self).infinitives
          @imperative_handler = ImperativesFactory.new(self).imperatives
          @participler = ParticiplesFactory.new(self).participles

          delegate_verb_method_calls_to_delegate!
        end

        private

        def delegate_verb_method_calls_to_delegate!
          self.extend Forwardable
          @querent.defined_tense_methods.each do |sym|
            self.def_delegator "@querent", sym
          end
        end

        public

          def_delegators :@validator, :valid?
          def_delegators :@classifier, :classification, :irregular?,
            :present_only?, :regular?, :set_as_defective, :short_class,
            :deponent?, :semideponent?, :proxy_verb?
          def_delegators :@prin_parts_extractor, :first_person_perfect,
            :first_person_perfect, :first_person_singular,
            :passive_perfect_participle, :present_active_infinitive,
            :present_active_infinitive, :principal_parts
          def_delegators :@participler, :supine, :future_active_participle,
            :future_passive_participle, :gerund, :gerundive,
            :perfect_passive_participle, :present_active_participle,
            :perfect_active_participle, :participle_methods
          def_delegators :@infinitivizer, :future_active_infinitive,
            :future_passive_infinitive, :infinitives,
            :perfect_active_infinitive, :perfect_passive_infinitive,
            :present_passive_infinitive, :infinitive_methods
          def_delegators :@stem_deriver, :stem, :participial_stem
          def_delegators :@type_evaluator, :short_type
          def_delegator  :@imperative_handler, :imperatives

          def_delegator :@classifier, :to_s, :conjugation
          def_delegator :@classifier, :dup, :classified_as
          def_delegator :@type_evaluator, :type, :verb_type
      end
    end
  end
end
