# encoding:  utf-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class << self
          # Given the principal parts as a string, decide which conjuation is in play
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
              elsif infinitive =~ /īre$/
                return Linguistics::Latin::Verb::VerbTypes::Fourth
              else
                raise RuntimeError "Could not identify this verb's classification"
              end
            end
          end
        end
      end
    end
  end
end

