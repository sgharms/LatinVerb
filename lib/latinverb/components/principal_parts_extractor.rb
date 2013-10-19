module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbPrincipalPartsExtractor
          def initialize(input_string, classification)
            @data_string = input_string
            @classification = classification

            if deponent_or_impersonal?
                @deponent_proxy = Linguistics::Latin::Verb::LatinVerb::DeponentStringDeriver.new(input_string).proxy_string
            else
              @principal_parts = principal_parts
              @first_person_singular, @present_active_infinitive,
              @first_person_perfect, @passive_perfect_participle = @principal_parts
            end
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

          def participial_stem
            calculate_participial_stem(present_active_infinitive, first_person_singular)
          end

          def stem
            if @classification.regular?
              calculate_stem(present_active_infinitive, first_person_singular)
            elsif @deponent_proxy
              DeponentStringDeriver.new(@data_string).proxy_string.split(/\s+/)[1]
            end
          end

          private

          def deponent_or_impersonal?
            @classification.deponent? or @classification.semideponent? or @classification.impersonal?
          end

          def calculate_stem(present_active_infinitive, first_person_singular)
            if present_active_infinitive =~ /āre$/
              return present_active_infinitive.gsub(/(.*)āre$/,'\\1ā')
            end
            if present_active_infinitive =~ /ēre$/
              return present_active_infinitive.gsub(/(.*)ēre$/,'\\1ē')
            end
            if present_active_infinitive =~ /ere$/
              if first_person_singular =~ /iō$/
                return present_active_infinitive.gsub(/(.*)ere$/,'\\1')
              else
                return present_active_infinitive.gsub(/(.*)ere$/,'\\1')
              end
            end
            if present_active_infinitive =~ /īre$/
              return present_active_infinitive.gsub(/(.*)īre$/,'\\1')
            end
          end


          def calculate_participial_stem(present_active_infinitive, first_person_singular)
            if present_active_infinitive.to_s =~ /(.*ā)re$/
              return $1
            end

            if present_active_infinitive.to_s =~ /(.*ē)re$/
              return $1
            end

            if present_active_infinitive.to_s =~ /(.*)ere$/
              match=$1
              if first_person_singular =~ /iō/
                return match + "iē"
              else
                return match + "e"
              end
            end

            if present_active_infinitive.to_s =~ /(.*)īre$/
              return $1 + "iē"
            end
          end
        end
      end
    end
  end
end
