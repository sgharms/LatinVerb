module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Infinitivizer
          class PassiveInfinitiveVactory
            extend Forwardable
            def_delegators :@verb, :present_active_infinitive, :verb_type

            MAPPING = {
              first: [/(.*)e$/,"\\1ī"],
              second: [/(.*)e$/,"\\1ī"],
              thirdio: [/(.*)ere$/,"\\1ī"],
              third: [/(.*)ere$/,"\\1ī"],
              fourth: [/(.*)e$/,"\\1ī"],
              irregular: [/(.*)/,"\\1"]
            }


            def initialize(verb)
              @verb = verb
            end

            def passive_infinitive
              present_active_infinitive.gsub(*mutation_for_type)
            end

            private

            def mutation_for_type
              MAPPING[type_key]
            end

            def type_key
              verb_type.to_s.split('::').last.downcase.to_sym
            end
          end
        end
      end
    end
  end
end
