require 'linguistics/latin/verb/phonographia'
require 'yaml'
require 'forwardable'

module Linguistics
  module Latin
    module Verb
      class ImperativeBlock
        extend Forwardable
        def_delegators :@results, :[], :to_a, :length

        def initialize(stem, plural_present_imperative, verb)
          @stem = stem
          @verb = verb
          @plural_present_imperative = plural_present_imperative
          @results = form_imperative_base

          add_additional_imperative_forms
          fix_macrons!
        end


        def present(qualifier=nil)
          j = @results[0,2]
          return j if qualifier.nil?
          qualifier = qualifier.to_s
          return j[0] if qualifier =~ /singular/
          return j[1] if qualifier =~ /plural/
        end

        def future(qualifier=nil)
          return @results[2,4] if qualifier.nil?
        end

        def to_s
          return @results
        end

        def to_json(*a)
          {
            'json_class'   => self.class.name,
            'data'         => @results.map{|i| i.to_json}
          }.to_json(*a)
        end

        def self.json_create(o)
         new(o['data'])
        end

        def method_missing(sym,*args)
           if (sym =~ /^(present|future)_tense_(.*)/)
             self.send($1.to_sym, $2)
           else
             super
           end
        end

        private

        def fix_macrons!
          @results = @results.map{|v| Linguistics::Latin::Phonographia.fix_macrons v}
        end

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
