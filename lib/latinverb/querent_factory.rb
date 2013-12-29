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
            Fourth: FourthQuerent,
            Irregular: IrregularQuerent
          }

          def initialize(verb)
            @verb = verb
          end

          def querent
	    vectorized_querent
          end

          private

	  def querent_with_unvectorized_tense_blocks
	    MAPPING[short_type].new(@verb)
	  end

	  def vectorized_querent
	    QuerentTenseMethodsVectorizer.new(querent_with_unvectorized_tense_blocks).add_vector_methods!
	  end
        end
      end
    end
  end
end
