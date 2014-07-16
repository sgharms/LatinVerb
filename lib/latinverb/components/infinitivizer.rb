#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Infinitivizer
          extend Forwardable

          def_delegators :@verb, :first_person_perfect, :future_active_participle, :verb_type, :present_active_infinitive, :perfect_passive_participle, :supine

          def initialize(verb)
            @verb = verb
          end

          def infinitives
            {
              :present_active_infinitive  => present_active_infinitive,
              :perfect_active_infinitive  => perfect_active_infinitive,
              :future_active_infinitive   => future_active_infinitive,
              :present_passive_infinitive => present_passive_infinitive,
              :perfect_passive_infinitive => perfect_passive_infinitive,
              :future_passive_infinitive  => future_passive_infinitive
            }
          end

          def perfect_active_infinitive
            first_person_perfect + "sse"
          end

          def future_active_infinitive
            future_active_participle.sub(/,.*/,'') + " esse"
          end

          def present_passive_infinitive
            PassiveInfinitiveFactory.new(@verb).passive_infinitive
          end

          def perfect_passive_infinitive
            perfect_passive_participle + " esse"
          end

          def future_passive_infinitive
            supine[:accusative] + " īrī"
          end
        end
      end
    end
  end
end
