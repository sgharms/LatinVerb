module Linguistics
  module Latin
    module Verb
      class ParticipleBlock
        def initialize(serializedBlock)
          @participle_methods = serializedBlock.keys
          @delegate = OpenStruct.new(serializedBlock)
        end

        def method_missing(sym, *args)
          @delegate.send(sym)
        end

        def self.json_create(o)
          new(o['data'])
        end
      end
    end
  end
end

