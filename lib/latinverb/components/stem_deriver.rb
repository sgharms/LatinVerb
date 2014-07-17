#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinverbStemDeriver
          def initialize(verb)
            @verb = verb
          end

          def stem
            verb_is_regular? ?  calculate_stem : calculate_deponent_proxy_stem
          end

          def participial_stem
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

          private

          def calculate_deponent_proxy_stem
            DeponentStringDeriver.new(@verb.original_string).proxy_string.split(/\s+/)[1]
          end

          def verb_is_regular?
            @verb.classifier.regular?
          end

          def present_active_infinitive
            @verb.present_active_infinitive
          end

          def first_person_singular
            @verb.first_person_singular
          end

          def deponent_or_impersonal?
            @verb.classifier.deponent? or @verb.classifier.semideponent? or @verb.classifier.impersonal?
          end

          def calculate_stem
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
        end
      end
    end
  end
end
