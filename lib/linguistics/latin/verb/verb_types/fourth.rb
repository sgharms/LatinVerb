module Linguistics
  module Latin
    module Verb
      module VerbTypes
        class Fourth < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem+"ī", stem+"īte"]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
             present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
        end
      end
    end
  end
end
