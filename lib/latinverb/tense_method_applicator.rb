require_relative './tense_method_applicator/querent'
require_relative './tense_method_applicator/querent_factory'
require_relative './tense_method_applicator/defective_checker'
require_relative './tense_method_applicator/deponent_string_deriver'
require_relative './tense_method_applicator/perfect_tense_remover'
require_relative './tense_method_applicator/mutator_for_classification_factory'
require_relative './tense_method_applicator/mutator_for_classification_factory_for_querent'
require_relative './tense_method_applicator/mutator_for_verb_type'
require_relative './tense_method_applicator/tense_methods_vectorizer'
require_relative './tense_method_applicator/querent_tense_methods_vectorizer'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          extend Forwardable
          def_delegators :@verb, :classified_as

          def initialize(verb)
            @verb = verb
            add_methods!
          end

          def querent
            @querent ||= load_query_object!
          end

          private

          def add_methods!
            load_tense_methods_unvarying_with_verb_type!
            load_tense_methods_based_on_verb_type!

            load_query_object!

            include_classification_specific_mixins!
            add_classification_specific_behavior_to_querent! # TODO:  Probably should go on querent

            mutate_defectives!
            mutate_defectives_on_querent! # TODO on querent

            add_number_and_person_methods_to_tense_block!
            add_number_and_person_methods_to_tense_block_on_querent!# TODO on querent

          end


          def load_query_object!
            QuerentFactory.new(@verb).querent
          end

          def load_tense_methods_unvarying_with_verb_type!
            Mutators::Invariant.new(@verb)
          end

          def load_tense_methods_based_on_verb_type!
            MutatorForVerbType.new(@verb).mutate!
          end

          def include_classification_specific_mixins!
            MutatorForClassificationFactory.new(@verb).mutator.mutate!
          end

          def add_classification_specific_behavior_to_querent!
            MutatorForClassificationFactoryForQuerent.new(@verb, querent).mutator.mutate!
          end

          def mutate_defectives!
            PerfectTenseRemover.new(@verb).remove! if DefectiveChecker.new(@verb).defective?
          end

          def mutate_defectives_on_querent!
            QuerentPerfectTenseRemover.new(querent).remove! if DefectiveChecker.new(@verb).defective?
          end

          def add_number_and_person_methods_to_tense_block!
            TenseMethodsVectorizer.new(@verb).add_vector_methods!
          end

          def add_number_and_person_methods_to_tense_block_on_querent!
            QuerentTenseMethodsVectorizer.new(querent).add_vector_methods!
          end
        end
      end
    end
  end
end
