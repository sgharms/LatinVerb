module Linguistics
  module Latin
    module Verb
      class TenseBlock
        include Linguistics::Latin::Phonographia

        extend Forwardable

        def_delegators :@results, :[], :empty?, :length, :to_a, :each
        def_delegators :@resolver,
          :first_person_singular_number, :singular_number_first_person,
          :second_person_singular_number, :singular_number_second_person,
          :third_person_singular_number, :singular_number_third_person,

          :first_person_plural_number, :plural_number_first_person,
          :second_person_plural_number, :plural_number_second_person,
          :third_person_plural_number, :plural_number_third_person,

          :first_person, :second_person, :third_person,

          :singular_number, :plural_number

        attr_reader :meaning, :results

        def initialize(r, opts={})
          @results = Array(r).map{ |v| fix_macrons(v) }
          @meaning = opts[:meaning] || ""
          @resolver = VectorResolutionDelegate.new(@results)
        end

        def to_s
          to_a.to_s
        end

        def wordless?
          !@results.find{ |r| r =~ /\w/ }
        end

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

