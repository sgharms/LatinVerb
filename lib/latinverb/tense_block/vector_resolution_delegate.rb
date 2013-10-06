module Linguistics
  module Latin
    module Verb
      class TenseBlock
        class VectorResolutionDelegate
          def initialize(results)
            @results = results
          end

          def first_person_singular_number
            @results[0]
          end

          def singular_number_first_person
            @results[0]
          end

          def second_person_singular_number
            @results[1]
          end

          def singular_number_second_person
            @results[1]
          end

          def third_person_singular_number
            @results[2]
          end

          def third_person_singular_number
            @results[2]
          end

          def singular_number_third_person
            @results[2]
          end

          def first_person_plural_number
            @results[3]
          end

          def plural_number_first_person
            @results[3]
          end

          def second_person_plural_number
            @results[4]
          end

          def plural_number_second_person
            @results[4]
          end

          def third_person_plural_number
            @results[5]
          end

          def plural_number_third_person
            @results[5]
          end

          def first_person
            [ @results[0], @results[3] ]
          end

          def second_person
            [ @results[1], @results[4] ]
          end

          def third_person
            [ @results[2], @results[5] ]
          end

          def singular_number
            [ @results[0],
              @results[1],
              @results[2] ]
          end

          def plural_number
            [ @results[3],
              @results[4],
              @results[5] ]
          end
        end
      end
    end
  end
end
