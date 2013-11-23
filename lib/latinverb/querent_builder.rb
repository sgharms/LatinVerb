module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentBuilder
          attr_reader :querent

          def initialize(verb)
            @verb = verb

            calculate_querent!
          end

          def delegates
            [querent, *calculate_components]
          end

          private

          def calculate_querent!
            @querent = if @verb.irregular?
              @builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
              @builder.querent
            else
              QuerentFactory.new(@verb).querent
            end
            mutate_defectives_on_querent!
            add_classification_specific_behavior_to_querent!
            add_number_and_person_methods_to_tense_block_on_querent!
          end

          def original_string
            @verb.original_string
          end

          def passive_perfect_participle
            @verb.passive_perfect_participle
          end

          def calculate_components
            if @verb.irregular?
              [
                @builder.infinitivizer,
                @builder.imperative_handler,
                @builder.participler
              ]
            else
              [
                Infinitivizer.new(@verb),
                ImperativesHandler.new(self),
                Participler.new(self)
              ]
            end
          end

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
