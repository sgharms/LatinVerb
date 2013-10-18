module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbPrincipalPartsExtractor
          def initialize(input_string, classification)
            @data_string = input_string
            @classification = classification
          end

          def principal_parts
            @data_string.split(/\s+/)
          end

          def first_person_singular
            principal_parts[0]
          end

          def present_active_infinitive
            principal_parts[1]
          end

          def first_person_perfect
            principal_parts[2]
          end

          def passive_perfect_participle
            principal_parts[3]
          end

        end
      end
    end
  end
end
