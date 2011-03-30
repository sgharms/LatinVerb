# encoding:  UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb

        # include Linguistics::Latin::Verb::Errors
        class << self


          ##
          # 
          # == ARGUMENTS
          # 
          #    * s :: a "four principal parts" string whence can be derived
          #  the first person singular present indicative as well as the
          #  infinitive
          # 
          # == RETURNS      
          # 
          # The classification, a subclass of VerbType
          # 
          # == PURPOSE      
          # 
          # Given the principal parts as a string, decide which conjuation is
          # in play
          # 
          # 
          ##
          def classify(s)

            if s.class == String
              divided_string = s.split /\s+/
 
              first_pres = divided_string[0]
              infinitive = divided_string[1]

              if    infinitive =~ /āre$/
                return Linguistics::Latin::Verb::VerbTypes::First
              elsif infinitive =~ /ēre$/
                return Linguistics::Latin::Verb::VerbTypes::Second
              elsif infinitive =~ /ere$/
                 if first_pres =~ /i.$/
                   return Linguistics::Latin::Verb::VerbTypes::ThirdIO
                 else
                   return Linguistics::Latin::Verb::VerbTypes::Third
                 end
              elsif infinitive =~ /.+īre$/
                return Linguistics::Latin::Verb::VerbTypes::Fourth
              elsif (infinitive =~ /ī$/  and first_pres =~ /r$/)
                return Linguistics::Latin::Verb::VerbTypes::Deponent
              else
                return Linguistics::Latin::Verb::VerbTypes::Irregular
              end
            end
          end

          ##
          # 
          # == ARGUMENTS
          # 
          #    * pres_act_inf
          # 
          # == RETURNS      
          # 
          # The “stem” of a Latin Verb
          # 
          # == PURPOSE      
          # 
          # Based on the present active infinitive, identify the “stem” and set the +@stem+
          # iVar.  The method also returns the stem value.
          # 
          ##
          def calculate_stem(pres_act_inf)
            # TODO: For efficiency, if the iVar @stem is defined, don't go through this structure?
            if pres_act_inf =~ /āre$/
              return pres_act_inf.gsub(/(.*)āre$/,'\\1ā')
            end
            if pres_act_inf =~ /ēre$/
              return pres_act_inf.gsub(/(.*)ēre$/,'\\1ē')
            end
            if pres_act_inf =~ /ere$/
              if @first_pers_singular =~ /iō$/
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              else
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              end
            end
            if pres_act_inf =~ /īre$/
              return pres_act_inf.gsub(/(.*)īre$/,'\\1')
            end
          end

          ##
          # 
          # == ARGUMENTS
          # 
          #     * first_person_singular
          #     * pres_act_inf
          # 
          # == RETURNS      
          # 
          # The participial “stem” of a Latin Verb, used for participle
          # formation
          # 
          # == PURPOSE      
          # 
          # Calculate the participial stem, used in forming participles.
          # 
          ##
          def calculate_participial_stem(first_pers_singular, pres_act_inf)
             raise("pres_act_inf was nil![#{first_pers_singular} and #{pres_act_inf}]") if
               pres_act_inf.empty? or first_pers_singular.empty?

             if pres_act_inf.to_s =~ /(.*ā)re$/
              return $1
            end

            if pres_act_inf.to_s =~ /(.*ē)re$/
              return $1
            end

            if pres_act_inf.to_s =~ /(.*)ere$/
              match=$1
              if first_pers_singular =~ /iō/
                return match + "iē"
              else
                return match + "e"
              end
            end

            if pres_act_inf.to_s =~ /(.*)īre$/
              return $1 + "iē"
            end
          end

        end
      end
    end
  end
end

