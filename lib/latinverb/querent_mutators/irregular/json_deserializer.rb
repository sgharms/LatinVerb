module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            class Deserializer
              attr_reader :revivified_data_structure

              def initialize(verb)
                @verb = verb
                json_string = Linguistics::Latin::Verb.const_get(symbolize_original_string)
                raise "Found a JSON string with an absurdly small length!" if json_string.length <= 10
                @revivified_data_structure = JSON.parse( json_string )
              rescue JSON::ParserError => e
                puts "We were unable to parse JSON for #{@verb.original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please verify your syntax."
                raise e
              rescue NameError => e
                puts "We were unable to find a definition for #{@verb.original_string}"
                raise e
              rescue => e
                warn "#{@verb.original_string} was identified as irregular but did not have a definition provided."
                raise e
              end

              private

              def symbolize_original_string
                # Translation added to account for Ruby not liking constants /^/
                # with a multibyte.  Probably a bug.
                #
                # This bug can be discovered by running #constants on
                # Linguistics::Latin::Verb and seeing that Ōxxx is not found.  To
                # fix this i had to store it as ODI_.  To make /that/ hack work, I
                # had to add this bit beginning two lines below :-/
                o = ActiveSupport::Multibyte::Chars.new( @verb.original_string.gsub(/\s+/,'_') ).upcase

                if o.match(/^([ĀĒĪŌŪ])(.*)/)
                  x=o[0,1].tr 'ĀĒĪŌŪ', 'AEIOU'
                  y=o[1,o.length]
                  o= x + y
                end

                o.to_sym
              end
            end
          end
        end
      end
    end
  end
end
