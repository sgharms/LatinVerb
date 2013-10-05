module Linguistics
  module Latin
    module Verb
      module VerbTypes
        class VerbType; end
        class First < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem, stem+"te"]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
            present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
        end
        class Second < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem, stem+"te"]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
            present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
        end
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
        class ThirdIO < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem+"e", stem+"ite"]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
             present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
          end
        end
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
        class Irregular < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, plural_present_imperative) do
              [stem, plural_present_imperative]
            end
          end
          def self.form_present_passive_infinitive(present_active_infinitive)
          end
        end
      end
    end
  end
end
