module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForClassificationFactory
            attr_reader :mutator

            def initialize(verb)
              @verb = verb
              @classification = verb.classification
              @mutator = calculate_mutator
            end

            def calculate_mutator
              klass = Mutators.const_get(@classification.to_s.split('::').last)
              klass.new(@verb)
            end
          end
        end
      end
    end
  end
end
