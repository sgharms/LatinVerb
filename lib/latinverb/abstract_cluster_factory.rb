module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class AbstractClusterFactory
          extend Forwardable
          def_delegators :@verb, :irregular?, :deponent?, :semideponent?, :original_string

          def initialize(verb)
            @verb = verb
          end


            def component
              return irregular if irregular?
              if deponent? || semideponent?
                deponent
              else
                standard
              end
            end

          alias :infinitives :component
          alias :imperatives :component
          alias :participles :component
        end
      end
    end
  end
end

