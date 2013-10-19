require_relative './first_builder'
require_relative './second_builder'
require_relative './third_builder'
require_relative './thirdio_builder'
require_relative './fourth_builder'
require_relative './irregular_builder'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            extend Forwardable
            def_delegators :@verb, :verb_type

            MAPPING = {
              First: FirstBuilder,
              Second: SecondBuilder,
              ThirdIO: ThirdIOBuilder,
              Third: ThirdBuilder,
              Fourth: FourthBuilder,
              Irregular: IrregularBuilder
            }

            def initialize(verb)
              @verb = verb
            end

            def mutate!
              MAPPING[verb_type.ordinal_name_key].new(@verb).build!
            end
          end
        end
      end
    end
  end
end
