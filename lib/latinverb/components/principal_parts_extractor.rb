module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbPPExtractor
          attr_reader :passive_perfect_participle, :first_person_perfect, :present_active_infinitive, :first_person_singular

          class << self

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

            def derive_parts_from_given_string(s)
              s.split(/\s+/)
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
          end# }}}

          def initialize(input_string, classification)
            @data_string = input_string
            @_classification = classification

            non_defective = ( classified_as.deponent? or
                              classified_as.semideponent? or
                              classified_as.impersonal? )
            unless non_defective
              @principal_parts = self.class.derive_parts_from_given_string input_string
              @first_person_singular, @present_active_infinitive,
              @first_person_perfect, @passive_perfect_participle = @principal_parts
            else
              unless classified_as.impersonal?
                @deponent_proxy = Linguistics::Latin::Verb::LatinVerb.create_pseudo_active_mask_for_deponent(input_string)
              end
            end
          end

          def participial_stem
            @participial_stem ||= self.class.calculate_participial_stem(@present_active_infinitive, @first_person_singular)
          end

          def principal_parts
            @principal_parts
          end

          def stem
            unless classified_as.irregular?
              self.class.calculate_stem(present_active_infinitive, first_person_singular)
            end
          end

          def classification
            @_classification
          end
          alias :classified_as :classification


        end

        def to_a
          @principal_parts
        end
      end
    end
  end
end
# vim:  set fdm=marker tw=80 sw=2:
