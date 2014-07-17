require_relative './tense_method_applicator/defective_checker'
require_relative './tense_method_applicator/deponent_string_deriver'
require_relative './tense_method_applicator/perfect_tense_remover'
require_relative './tense_method_applicator/mutator_for_classification_factory'
require_relative './tense_method_applicator/mutator_for_classification_factory_for_querent'
require_relative './tense_method_applicator/tense_methods_vectorizer'
require_relative './tense_method_applicator/querent_tense_methods_vectorizer'
require_relative './tense_method_applicator/mutators/deponent'


require_relative './tense_method_applicator/mutators/irregular'
require_relative './tense_method_applicator/mutators/irregular/json_deserializer'
require_relative './tense_method_applicator/mutators/irregular/infinitives_builder'
require_relative './tense_method_applicator/mutators/irregular/participles_builder'
require_relative './tense_method_applicator/mutators/irregular/present_only_irregular_mask'
require_relative './tense_method_applicator/mutators/irregular/infinitives_builder'
require_relative './tense_method_applicator/mutators/irregular/participles_builder'


module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          extend Forwardable
          def_delegators :@verb, :classified_as, :querent

          def initialize(verb)
            @verb = verb
            frobnicate_the_querent!
          end

          private

          def frobnicate_the_querent!
            # TODO:  These probably should go on querent
            mutate_defectives_on_querent!
            @verb.extend Forwardable
            irregular_frobnicate! if @verb.irregular?
            add_classification_specific_behavior_to_querent!
            add_number_and_person_methods_to_tense_block_on_querent!
            delegate_verb_method_calls_to_delegate!
          end

          def delegate_verb_method_calls_to_delegate!
            querent.methods.grep(/\w+voice\w+mood\w+tense/).each do | sym |  # TODO goes on querent...
              @verb.def_delegator "@querent", sym.to_s
            end
          end
          def load_tense_methods_unvarying_with_verb_type!
            Mutators::Invariant.new(@verb)
          end

          def load_tense_methods_based_on_verb_type!
            MutatorForVerbType.new(@verb).mutate!
          end

          def irregular_frobnicate!
             Mutators::Irregular.new(@verb).mutate!
          end

          def add_classification_specific_behavior_to_querent!
            MutatorForClassificationFactoryForQuerent.new(@verb, querent).mutator.mutate!
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
