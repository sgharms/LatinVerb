module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            class Revivifier
              class InfinitivesBuilder
                def initialize(verb, infinitives_structure)
                  @verb = verb
                  @infinitives_structure = infinitives_structure
                  mutate!
                end

                def mutate!
                  i = OpenStruct.new(@infinitives_structure)

                  @verb.instance_exec do
                    @_infinitives = i
                    def present_active_infinitive; @_infinitives.present_active_infinitive; end
                    def present_passive_infinitive; @_infinitives.present_passive_infinitive; end
                    def perfect_active_infinitive; @_infinitives.perfect_active_infinitive; end
                    def perfect_passive_infinitive; @_infinitives.perfect_passive_infinitive; end
                    def future_passive_infinitive; @_infinitives.future_passive_infinitive; end
                    def future_active_infinitive; @_infinitives.future_active_infinitive; end
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
