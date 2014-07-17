module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class ImpersonalQuerent < Querent
          def tense_definitions_template
            [IrregularQuerent::ActiveVoiceIndicativeMoodPresentTenseMethods]
          end
        end
      end
    end
  end
end
