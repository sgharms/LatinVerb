# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbTypeEvaluator
          def initialize(first_pres, infinitive, classifier)
            return unless classifier.classification.to_s.split('::').last.eql?("Regular")
            @type = if  infinitive =~ /āre$/
              Linguistics::Latin::Verb::VerbTypes::First
            elsif infinitive =~ /ēre$/
              Linguistics::Latin::Verb::VerbTypes::Second
            elsif infinitive =~ /ere$/
              first_pres =~ /i.$/ ? Linguistics::Latin::Verb::VerbTypes::ThirdIO : Linguistics::Latin::Verb::VerbTypes::Third
            elsif infinitive =~ /.+īre$/
              Linguistics::Latin::Verb::VerbTypes::Fourth
            elsif (infinitive =~ /ī$/  and first_pres =~ /r$/)
              Linguistics::Latin::Verb::VerbTypes::Deponent
            else
              raise "Could not find a verb type for this verb #{infinitive} and #{first_pres}"
            end
          end

          def inspect
            return @type
          end
        end
      end
    end
  end
end

