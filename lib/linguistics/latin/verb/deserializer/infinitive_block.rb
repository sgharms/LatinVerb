module Linguistics
  module Latin
    module Verb
      class InfinitiveBlock
        extend Forwardable

        def_delegators :@delegate, :present_active_infinitive,
          :present_passive_infinitive, :perfect_active_infinitive,
          :perfect_passive_infinitive, :future_active_infinitive,
          :future_passive_infinitive

        def initialize(serialized_infinitives)
          @serialized_infinitives = serialized_infinitives
          @delegate = OpenStruct.new(serialized_infinitives)
        end

        def self.json_create(o)
          new(o['data'])
        end
      end
    end
  end
end

