require_relative './impersonal_verb_mixin'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImpersonalQuerent < Querent
          include ImpersonalVerbMixin

          def initialize(*args)
            @verb = args[0] if !args.empty?
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
