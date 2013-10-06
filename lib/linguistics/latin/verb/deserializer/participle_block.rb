module Linguistics
  module Latin
    module Verb
      class ParticipleBlock
        extend Forwardable
        def_delegators :@delegate, :present_active_participle, :future_active_participle, :perfect_passive_participle, :future_passive_participle

        def initialize(serializedBlock)
          @participle_methods = serializedBlock.keys
          @delegate = OpenStruct.new(serializedBlock)
        end

        def self.json_create(o)
          new(o['data'])
        end
      end
    end
  end
end

