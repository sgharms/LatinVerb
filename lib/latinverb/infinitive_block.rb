require 'ostruct'

module Linguistics
  module Latin
    module Verb
      class InfinitiveBlock
        attr_reader :infinitive_methods
        def initialize(serialized_infinitives)
          @serialized_infinitives = serialized_infinitives
          @delegate = OpenStruct.new(serialized_infinitives)
        end

        def self.json_create(o)
          new(o['data'])
        end

        def method_missing(sym, *args)
          @delegate.send(sym)
        end
      end
    end
  end
end

