module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImpersonalQuerent < Querent
          def initialize(verb)
            @verb = verb
            @added_vectorized_method = []
          end

          def imperatives
            OpenStruct.new( :future => Proc.new{}, :present => Proc.new{} )
          end
        end
      end
    end
  end
end
