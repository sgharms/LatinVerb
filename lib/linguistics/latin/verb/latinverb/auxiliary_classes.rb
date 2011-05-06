# encoding: UTF-8

require 'linguistics/latin/verb/phonographia'
require 'yaml'

module Linguistics 
  module Latin 
    module Verb 
      class ImperativeBlock
        def initialize(stem,ppi)
          # In case we get an Array, for JSON revivification
          if stem.class == Array
            @results = stem
          end

          r = case
              when ppi =~ /āre$/
                [stem, stem+"te"]
              when ppi =~ /ēre$/           
                [stem, stem+"te"]
              when ppi =~ /ere$/
                [stem+"e", stem+"ite"]
              when ppi =~ /īre$/
                [stem+"ī", stem+"īte"]
              end 

          r << stem + "tō"
          r << stem + "tōte"

          r << stem + "tō"
          r << stem + "ntō"
 
          @results = r.map{|v| Linguistics::Latin::Phonographia.fix_macrons v}
        end

        def to_s
          return @results
        end

        ##
        #
        # Required for serialization
        #
        ##
        def to_json(*a)
          {
            'json_class'   => self.class.name, 
            'data'         => @results.map{|i| i.to_json}
          }.to_json(*a)
        end

        ##
        #
        # Required for deserialization
        #
        ##
        def self.json_create(o)
         new(o['data']) 
        end

        ##
        #
        # Provides Array-like interface to the collection of results.
        #
        ##
        def [](arg)
          @results[arg]
        end

        ##
        #
        # To Array, useful in serialization
        #
        ##
        def to_a
          return @results
        end

        ##
        #
        # Add array compatibility support
        #
        ##
        def length; return @results.length; end

        ##
        #
        # Returns the two, second person imperatives
        #
        ##
        def present(qualifier=nil)
          j=@results[0,2]
          return j if qualifier.nil?
          qualifier = qualifier.to_s
          return j[0] if qualifier =~ /singular/
          return j[1] if qualifier =~ /plural/
        end

        ##
        #
        # Returns the four, second and third person future imperatives
        #
        ##
        def future(qualifier=nil)
          return j=@results[2,4] if qualifier.nil?

          # case
          #   when qualifier =~ /second_person/
          #     if qualifier =~ /singular/
          #       return j[0]
          #     elsif qualifier =~ /plural/
          #       return j[2]
          #     else
          #       return [ j[0], j[2] ]
          #     end
          #   when qualifier =~ /third_person/
          #     if qualifier =~ /singular/
          #       return j[1]
          #     elsif qualifier =~ /plural/
          #       return j[3]
          #     else
          #       return [ j[1], j[3] ]
          #     end
          #   else
          #     raise "[future] could not parse this imperative"
          #   end
          # end
        end

        def method_missing(sym,*args)
           if (sym =~ /^(present|future)_tense_(.*)/)
             self.send($1.to_sym, $2) 
           else
             super
           end
        end
      end
    end
  end
end
