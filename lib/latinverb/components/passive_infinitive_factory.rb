#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Infinitivizer
          class PassiveInfinitiveFactory
            extend Forwardable
            def_delegators :@verb, :present_active_infinitive, :verb_type

            MAPPING = {
              First: [/(.*)e$/,"\\1ī"],
              Second: [/(.*)e$/,"\\1ī"],
              ThirdIO: [/(.*)ere$/,"\\1ī"],
              Third: [/(.*)ere$/,"\\1ī"],
              Fourth: [/(.*)e$/,"\\1ī"],
              Irregular: [/(.*)/,"\\1"]
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
              verb_type.ordinal_name_key
            end
          end
        end
      end
    end
  end
end
