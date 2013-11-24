module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentBuilder
          extend Forwardable
          def_delegators :@verb, :short_class, :irregular?, :deponent?, :regular?

          MAPPING = {
          }

          attr_reader :querent

          def initialize(verb)
            @verb = verb
          end

          def call

            if irregular?
              builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
              @querent = builder.querent
              add_number_and_person_methods_to_tense_block_on_querent!
              @infinitivizer = builder.infinitivizer
              @imperative_handler = builder.imperative_handler
              @participler = builder.participler
            else
              @querent = QuerentFactory.new(@verb).querent
              mutate_defectives_on_querent!
              add_classification_specific_behavior_to_querent!
              add_number_and_person_methods_to_tense_block_on_querent!
              @infinitivizer = Infinitivizer.new(@verb)
              @imperative_handler = ImperativesHandler.new(@verb)
              @participler = Participler.new(@verb)
            end
            [ @querent, @infinitivizer, @imperative_handler, @participler  ]
          end

          def others
            if irregular?
              builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
              @infinitivizer = builder.infinitivizer
              @imperative_handler = builder.imperative_handler
              @participler = builder.participler
            else
              @infinitivizer = Infinitivizer.new(@verb)
              @imperative_handler = ImperativesHandler.new(@verb)
              @participler = Participler.new(@verb)
            end
            [@infinitivizer, @imperative_handler, @participler  ]
          end

          def get_querent
            irregular? ? call3 : call2
          end

          def call2
            @querent = QuerentFactory.new(@verb).querent
            mutate_defectives_on_querent!
            add_classification_specific_behavior_to_querent!
            @querent
          end

          def call3
            b = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
            q = b.querent
            add_number_and_person_methods_to_tense_block_on_querent2(q)
            q
          end




















          def delegates
            [querent, *calculate_components]
          end

          private


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

          def add_number_and_person_methods_to_tense_block_on_querent2(q)
            QuerentTenseMethodsVectorizer.new(q).add_vector_methods!
          end

          def add_number_and_person_methods_to_tense_block_on_querent!
            QuerentTenseMethodsVectorizer.new(@querent).add_vector_methods!
          end
        end
      end
    end
  end
end
