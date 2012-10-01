module Linguistics
  module Latin
    module Verb
      class ParticipleBlock
        attr_reader :participle_methods

        def initialize(s)
          raise "ParticipleBlock instantiation argument was nil!" if s.nil?

          if s.is_a? Hash
            @participle_methods = s.keys
          end

          @participle_methods.each do |k|
            v=s[k]
            singleton_class.class_eval do
              define_method k.to_sym do
                return v
              end
            end
          end
        end

        ##
        #
        # Required for deserialization
        #
        ##
        def self.json_create(o)
          new(o['data'])
        end
      end
    end
  end
end

