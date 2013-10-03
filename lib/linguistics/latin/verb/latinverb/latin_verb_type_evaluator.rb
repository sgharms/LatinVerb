module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbTypeEvaluator
          def initialize(first_pres, infinitive, classifier)
            @first_pres = first_pres
            @infinitive = infinitive
            @classifier = classifier
            @type = determine_type
          end

          def determine_type
            if @infinitive =~ /āre$/
              Linguistics::Latin::Verb::VerbTypes::First
            elsif @infinitive =~ /ēre$/
              Linguistics::Latin::Verb::VerbTypes::Second
            elsif @infinitive =~ /ere$/
              @first_pres =~ /i.$/ ? Linguistics::Latin::Verb::VerbTypes::ThirdIO : Linguistics::Latin::Verb::VerbTypes::Third
            elsif @infinitive =~ /.+īre$/
              Linguistics::Latin::Verb::VerbTypes::Fourth
            elsif (@infinitive =~ /ī$/  and @first_pres =~ /r$/)
              Linguistics::Latin::Verb::VerbTypes::Deponent
            else
              Linguistics::Latin::Verb::VerbTypes::Irregular
            end
          end

          def inspect
            @type
          end
        end
      end
    end
  end
end
