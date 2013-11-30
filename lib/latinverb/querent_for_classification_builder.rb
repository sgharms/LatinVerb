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
          def_delegators :@verb, :short_class

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
            delegate_verb_method_calls_to_delegate!
          end

          def delegate_verb_method_calls_to_delegate!
            @verb.extend Forwardable
            # TODO: I'd like to take this grep thing away...we should get rid of greps...
            @querent.defined_tense_methods.each do |sym|
              @verb.def_delegator "@querent", sym.to_s
            end
          end
        end
      end
    end
  end
end
