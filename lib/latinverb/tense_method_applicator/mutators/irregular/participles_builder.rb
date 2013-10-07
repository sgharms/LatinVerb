module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Irregular
            class Revivifier
              class ParticiplesBuilder
                def initialize(verb, participles_structure)
                  @verb = verb
                  @participles_structure = participles_structure
                  mutate!
                end

                def mutate!
                  i = @participles_structure
                  @verb.instance_eval do
                    @__irregular_participles = i
                    def present_active_participle; @__irregular_participles.present_active_participle; end
                    def future_active_participle; @__irregular_participles.future_active_participle; end
                    def perfect_passive_participle; @__irregular_participles.perfect_passive_participle; end
                    def future_passive_participle; @__irregular_participles.future_passive_participle; end
                    def gerundive; @__irregular_participles.gerundive; end
                    def gerund; @__irregular_participles.d; end
                  end

                end
              end
            end
          end
        end
      end
    end
  end
end
