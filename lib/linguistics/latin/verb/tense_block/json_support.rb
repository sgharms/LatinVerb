
module Linguistics
  module Latin
    module Verb
      class TenseBlock
        module JsonSupport
          def to_json(*a)
            {
              'json_class'   => self.class.name,
              'data'         => @results.map{|i| i.to_json}
            }.to_json(*a)
          end

          def TenseBlock.json_create(o)
           new(o['data'])
          end
        end
      end
    end
  end
end
