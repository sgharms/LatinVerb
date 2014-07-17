require_relative './querent'
require_relative './querent/first'
require_relative './querent/second'
require_relative './querent/third'
require_relative './querent/third_io'
require_relative './querent/fourth'
require_relative './querent/irregular'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class QuerentFactory
            extend Forwardable

            MAPPING = {
              First: TenseMethodApplicator::FirstQuerent,
              Second: TenseMethodApplicator::SecondQuerent,
              Third: TenseMethodApplicator::ThirdQuerent,
              ThirdIO: TenseMethodApplicator::ThirdIOQuerent,
              Fourth: TenseMethodApplicator::FourthQuerent,
              Irregular: TenseMethodApplicator::IrregularQuerent,
            }

            def_delegators :@verb, :verb_type

            def initialize(verb)
              @verb = verb
            end

            def querent
              MAPPING[short_verb_type].new(@verb)
            end

            private

            def short_verb_type
              verb_type.to_s.split('::').last.to_sym
            end
          end
        end
      end
    end
  end
end
