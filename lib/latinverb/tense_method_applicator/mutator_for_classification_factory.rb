require_relative './mutators/deponent'
require_relative './mutators/invariant'
require_relative './mutators/irregular'
require_relative './mutators/semideponent'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForClassificationFactory
            extend Forwardable
            def_delegators :@classification, :short_name_key

            MAPPING = {
              Irregular: Mutators::Irregular,
              Deponent: Mutators::Deponent,
              Semideponent: Mutators::Semideponent,
            }

            def initialize(verb)
              @verb = verb
              @classification = verb.classification
            end

            def mutator
              return MAPPING[short_name_key].new(@verb) if MAPPING.has_key?(short_name_key)
              OpenStruct.new( mutate!: -> {} )
            end
          end
        end
      end
    end
  end
end
