module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImpersonalQuerent < Querent
          def initialize(verb)
            @verb = verb
            @added_vectorized_method = []
          end

          def add_method(method_name)
            @added_vectorized_method << method_name.to_sym
          end

          def imperatives
            OpenStruct.new( :future => Proc.new{}, :present => Proc.new{} )
          end
        end
      end
    end
  end
end
