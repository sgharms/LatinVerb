module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularComponentsBuilder
          extend Forwardable
          def_delegators :@verb, :original_string, :passive_perfect_participle

          def initialize(verb)
            byebug #2
            @verb = verb
            @builder = QuerentMutators::Irregular.new(original_string, passive_perfect_participle)
          end

          def components
            @infinitivizer = @builder.infinitivizer
            @imperative_handler = @builder.imperative_handler
            @participler = @builder.participler
            [ @infinitivizer, @imperative_handler, @participler ]
          end
        end
      end
    end
  end
end
