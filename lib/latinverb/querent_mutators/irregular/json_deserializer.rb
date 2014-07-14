module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            class JsonDeserializer
              extend Forwardable
              def_delegators :@retriver, :serialized_verb
              attr_reader :revivified_data_structure

              def initialize(lookup_string)
                @lookup_string = lookup_string
                @retriver = Linguistics::Latin::Verb::LatinVerb::IrregularVerbSerializationRetriever.new(@lookup_string)
                @revivified_data_structure = eager_load_serialized_object
              end

              private

              def eager_load_serialized_object
                JSON.parse(serialized_verb)
              rescue JSON::ParserError => e
                puts "We were unable to parse JSON for #{@lookup_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please verify your syntax."
                raise e
              rescue NameError => e
                puts "We were unable to find a definition for #{@lookup_string}"
                raise e
              rescue => e
                warn "#{@lookup_string} was identified as irregular but did not have a definition provided."
                raise e
              end
            end
          end
        end
      end
    end
  end
end
