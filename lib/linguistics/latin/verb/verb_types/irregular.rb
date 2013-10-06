module Linguistics
  module Latin
    module Verb
      module VerbTypes
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
