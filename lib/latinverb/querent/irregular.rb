require_relative './impersonal_verb_mixin'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularQuerent < Querent
          def initialize(*args)
            @verb = args[0] if !args.empty?
            @added_vectorized_method = []
	    self.extend(ImpersonalVerbMixin) if impersonal?
          end

          def imperatives
            OpenStruct.new( :future => Proc.new{}, :present => Proc.new{} )
          end

	  private

	  def impersonal?
	    return false unless @verb
	    Linguistics::Latin::Verb::IMPERSONAL_VERBS.member?(@verb.original_string)
	  end
        end
      end
    end
  end
end
