require_relative './querent_for_classification_strategy/irregular'
require_relative './querent_for_classification_strategy/other'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          extend Forwardable
          def_delegators :@verb, :short_class, :irregular?, :deponent?, :regular?, :original_string, :passive_perfect_participle
          def_delegators :@strategy, :querent

          MAPPING = {
            Irregular: QuerentForClassificationStrategy::Irregular
          }

          def initialize(verb)
            @verb = verb
            @strategy = calculate_strategy.new(@verb)
            call
          end


          def calculate_strategy
            MAPPING[short_class.to_sym] || QuerentForClassificationStrategy::Other
          end

          def call
            if irregular?
              builder = QuerentForClassificationStrategy::Irregular.new(@verb).builder
              add_number_and_person_methods_to_tense_block_on_querent!
              @infinitivizer = builder.infinitivizer
              @imperative_handler = builder.imperative_handler
              @participler = builder.participler
            else
              mutate_defectives_on_querent!
              add_classification_specific_behavior_to_querent!
              add_number_and_person_methods_to_tense_block_on_querent!
              @infinitivizer = Infinitivizer.new(@verb)
              @imperative_handler = ImperativesHandler.new(@verb)
              @participler = Participler.new(@verb)
            end
          end

          def not_querent
            [ @infinitivizer, @imperative_handler, @participler  ]
          end

          private

          def mutate_defectives_on_querent!
            QuerentPerfectTenseRemover.new(@querent).remove! if DefectiveChecker.new(@verb).defective?
          end

          def add_classification_specific_behavior_to_querent!
            MutatorForClassificationFactoryForQuerent.new(@verb, @querent).mutator.mutate!
          end

          def add_number_and_person_methods_to_tense_block_on_querent!
            QuerentTenseMethodsVectorizer.new(@querent).add_vector_methods!
          end
        end
      end
    end
  end
end
