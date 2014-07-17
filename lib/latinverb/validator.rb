module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Validator
          def initialize(verb)
            @verb = verb
          end

          def valid?
            has_original_string? && has_classification? && has_stem?
          end

          private

          def has_original_string?
            !@verb.original_string.nil?
          end

          def has_classification?
            !@verb.classification.nil?
          end

          def has_stem?
            @verb.irregular? || !@verb.stem.nil?
          end
        end
      end
    end
  end
end
