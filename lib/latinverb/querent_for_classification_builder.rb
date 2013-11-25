require_relative './querent_for_classification_strategy/irregular'
require_relative './querent_for_classification_strategy/regular'
require_relative './querent_for_classification_strategy/present_only'
require_relative './querent_for_classification_strategy/deponent'
require_relative './querent_for_classification_strategy/semideponent'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentForClassificationBuilder
          extend Forwardable
          def_delegators :@verb, :short_class, :irregular?, :deponent?, :regular?, :original_string, :passive_perfect_participle

          MAPPING = {
            Regular: QuerentForClassificationStrategy::Regular,
            Irregular: QuerentForClassificationStrategy::Irregular,
            PresentOnly: QuerentForClassificationStrategy::PresentOnly,
            Deponent: QuerentForClassificationStrategy::Deponent,
            Semideponent: QuerentForClassificationStrategy::Semideponent,
            Impersonal: QuerentForClassificationStrategy::Regular,
          }

          attr_reader :querent

          def initialize(verb)
            @verb = verb
            @querent = MAPPING[short_class.to_sym].new(@verb).querent
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
        end
      end
    end
  end
end
