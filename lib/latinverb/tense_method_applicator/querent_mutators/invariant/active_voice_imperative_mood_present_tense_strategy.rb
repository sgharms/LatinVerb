module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            # Commands for immediate action.  Always second person.
            class ActiveVoiceImperativeMoodPresentTenseStrategy
              def initialize(verb)
                @verb = verb
              end

              def apply!
                @verb.instance_eval do
                  def active_voice_imperative_mood_present_tense
                    imp = imperatives
                    elements = [ '', imp.present_tense_singular_number, '', '', imp.present_tense_plural_number, '' ]
                    meaning = { :meaning => MEANINGS[:active_voice_imperative_mood_present_tense] }
                    TenseBlock.new(elements, meaning)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
