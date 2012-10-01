module Linguistics
  module Latin
    module Verb
      ##
      #
      # The InfinitiveBlock holds the infinitives associated with a given
      # verb.  The known infinitives are the following:
      #
      ##
      class InfinitiveBlock
        attr_reader :infinitive_methods
        def initialize(s)
          if s.is_a? Hash
            @infinitive_methods = s.keys
          end

          @infinitive_methods.each do |k|
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

