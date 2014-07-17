module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentFactory
          extend Forwardable
          def_delegators :@verb, :short_type


          MAPPING = {
            First: FirstQuerent,
            Second: SecondQuerent,
            Third: ThirdQuerent,
            ThirdIO: ThirdIOQuerent,
            Fourth: FourthQuerent
          }

          def initialize(verb)
            @verb = verb
          end

          def querent
            MAPPING[short_type].new(@verb)
          end
        end
      end
    end
  end
end
