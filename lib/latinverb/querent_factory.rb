module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class QuerentFactory
          extend Forwardable
          def_delegators :@verb, :verb_type


          MAPPING = {
            First: FirstQuerent,
            Second: SecondQuerent,
            Third: ThirdQuerent,
            ThirdIO: ThirdIOQuerent,
            Fourth: FourthQuerent,
            Irregular: IrregularQuerent, # TODO: bad name, not right....
          }

          def initialize(verb)
            @verb = verb
          end

          def querent
            MAPPING[short_verb_type].new(@verb) if MAPPING.has_key?(short_verb_type)
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
