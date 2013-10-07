module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Irregular
            class Revivifier
              class InfinitivesBuilder
                def initialize(verb, infinitives_structure)
                  @verb = verb
                  @infinitives_structure = infinitives_structure
                  mutate!
                end

                def mutate!
                  i = @infinitives_structure

                  @verb.instance_eval do
                    @__irregular_infinitives = i
                    def present_active_infinitive; @__irregular_infinitives.present_active_infinitive; end
                    def present_passive_infinitive; @__irregular_infinitives.present_passive_infinitive; end
                    def perfect_active_infinitive; @__irregular_infinitives.perfect_active_infinitive; end
                    def perfect_passive_infinitive; @__irregular_infinitives.perfect_passive_infinitive; end
                    def future_passive_infinitive; @__irregular_infinitives.future_passive_infinitive; end
                    def future_active_infinitive; @__irregular_infinitives.future_active_infinitive; end
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
