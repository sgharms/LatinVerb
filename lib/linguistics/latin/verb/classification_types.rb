# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      module Classification
        class ClassificationType; end
        class Defective < ClassificationType; end
        class Deponent < ClassificationType; end
        class Impersonal < ClassificationType; end
        class Irregular < ClassificationType; end
        class PresentOnly < ClassificationType; end
        class Regular < ClassificationType; end
        class Semideponent < ClassificationType; end
      end

      module VerbTypes
        class VerbType; end
        class First < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem, stem+"te"]
            end
          end
        end
        class Second < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem, stem+"te"]
            end
          end
        end
        class Third < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem+"e", stem+"ite"]
            end
          end
        end
        class ThirdIO < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem+"e", stem+"ite"]
            end
          end
        end
        class Fourth < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem+"ī", stem+"īte"]
            end
          end
        end
        class Irregular < VerbType
          def self.form_present_tense_imperative_rule
            ->(stem, ppi) do
              [stem, ppi]
            end
          end
        end
      end
    end
  end
end

