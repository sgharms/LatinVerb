module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentParticipler < Participler
          extend Forwardable
          def_delegators :@verb, :passive_perfect_participle, :participial_stem, :original_string

          def initialize(verb)
            super
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string, :proxy_verb => true)
          end

          def present_active_participle
            return @proxyVerb.present_active_participle
          end

          def future_active_participle
            return @proxyVerb.future_active_participle
          end

          def perfect_active_participle
            return @proxyVerb.perfect_passive_participle
          end

          def future_passive_participle
            return @proxyVerb.future_passive_participle
          end

          # Mask the supine
          def supine
            return @proxyVerb.supine
          end
        end
      end
    end
  end
end
