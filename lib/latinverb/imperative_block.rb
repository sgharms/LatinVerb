module Linguistics
  module Latin
    module Verb
      class ImperativeBlock
        extend Forwardable
        def_delegators :@results, :[], :to_a, :length

        include Linguistics::Latin::Phonographia
        def initialize(stem, plural_present_imperative, verb)
          @stem = stem
          @plural_present_imperative = plural_present_imperative
          @verb = verb
          @results = form_imperative_base
          add_additional_imperative_forms
          @results.map{|v| fix_macrons v}
        end

        def present_tense_singular_number
          present('singular')
        end

        def present_tense_plural_number
          present('plural')
        end

        def future(qualifier=nil)
          return @results[2,4] if qualifier.nil?
        end

        def present(qualifier=nil)
          j = @results[0,2]
          return j if qualifier.nil?
          qualifier = qualifier.to_s
          return j[0] if qualifier =~ /singular/
          return j[1] if qualifier =~ /plural/
        end

        private


        def add_additional_imperative_forms
          @results << @stem + "tō"
          @results << @stem + "tōte"

          @results << @stem + "tō"
          @results << @stem + "ntō"
        end

        def form_imperative_base
          @verb.verb_type.form_present_tense_imperative_rule.call(@stem, @plural_present_imperative)
        end
      end
    end
  end
end
