module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class LatinVerbTypeEvaluator
          extend Forwardable
          # "Type" is key stem associated with the verb versus the
          # classification.  i.e. a verb might be "classified" as "Deponent"
          # but has a "type" of first conjugation e.g. miror / mirari
          def_delegators :@verb, :first_person_singular, :present_active_infinitive

          def initialize(verb)
            @verb = verb
          end

          def type
            if present_active_infinitive =~ /āre$/
              Linguistics::Latin::Verb::VerbTypes::First
            elsif present_active_infinitive =~ /ēre$/
              Linguistics::Latin::Verb::VerbTypes::Second
            elsif present_active_infinitive =~ /ere$/
              first_person_singular =~ /i.$/ ? Linguistics::Latin::Verb::VerbTypes::ThirdIO : Linguistics::Latin::Verb::VerbTypes::Third
            elsif present_active_infinitive =~ /.+īre$/
              Linguistics::Latin::Verb::VerbTypes::Fourth
            elsif (present_active_infinitive =~ /ī$/  and first_person_singular =~ /r$/)
              LatinVerb.new(DeponentStringDeriver.new(@verb.original_string).proxy_string).verb_type
            else
              Linguistics::Latin::Verb::VerbTypes::Irregular
            end
          end
        end
      end
    end
  end
end
