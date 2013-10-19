module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Irregular
            class PresentOnlyIrregularMask
              def initialize(verb)
                @verb = verb
              end

              def apply!
                return unless irregular_and_present_only?
                @verb.singleton_class.class_eval do
                  def classification
                    Classification::PresentOnly
                  end

                  def present_only?
                    true
                  end
                end
              end

              private

              # Very irregular irregulars, A&G206, e/f
              def irregular_and_present_only?
                @verb.original_string.match(%r'^(aiō|quaesō|ovāre)$')
              end
            end
          end
        end
      end
    end
  end
end
