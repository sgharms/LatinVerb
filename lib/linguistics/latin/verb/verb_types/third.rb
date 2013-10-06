module Linguistics
  module Latin
    module Verb
      module VerbTypes
        class Third < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem+"e", stem+"ite"]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
             present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
          end
        end
      end
    end
  end
end
