# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2:

module Linguistics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      class LatinVerb
        class LatinVerbInitializationError < Exception; end
        class LatinVerbInputSanitizer# {{{
          def initialize(raw_data)
            @raw_data = raw_data.dup

            unless ( raw_data.is_a? String )
              raw_data_type    = raw_data.class.to_s.downcase
              method_prefix    = 'construct_original_string_for_'
              mutator          = ( method_prefix + raw_data_type ).to_sym
              raw_data = send(mutator, raw_data)
            end

            @sanitized_data = raw_data
          end

          def to_s
            return @sanitized_data
          end
        end# }}}
      end
    end
  end
end
