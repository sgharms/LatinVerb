# encoding: UTF-8

require 'linguistics/latin/verb/phonographia'

module Linguistics
  module Latin
    module Verb
    ##
    # == NAME
    #
    # TenseBlock
    #
    # == DESCRIPTION
    #
    # As per the LatinVerb documentation, LatinVerbs decorate themselves with
    # the method which loads up a voice/tense/mood black box.  That black box
    # is a TenseBlock.  The TenseBlock, in turn, responds to getting the final
    # two components of the fully-qualified vector back (person and number).
    # It also has Array-like behaviors (e.g. +[]+) based on the 2 * 3 matrix.
    #
    # == INTERNALS
    #
    # Internally, a Tenseblock is effectively an Array of the arguments passed
    # in during TenseBlock.initialize.  These are assumed to be
    # first/singular, second/singular, third/singular and then
    # first/plural, second/plural, third/plural.
    #
    # Syntactic sugar methods are added to access this array.  Thus, in a
    # LatinVerb a fully-qualified vectors first 3/5 data resolve to a
    # TenseBlock.  The last 2/5 of resolution occurs within the TenseBlock
    # (effectively pulling the contents of the Array).  Therefore, when a
    # LatinVerb is accessed with the quinpartite fully-qualified vector it can
    # return the unique value.  The mechanics of this hook through (surprise!)
    # method_missing.
    #
    #
    ##

      class TenseBlock
        include  Linguistics::Latin::Phonographia
        @tb_canonical_accessors = []
        @tb_alias_accessors     = []
        @tb_accessors           = []

        class << self
          def null_tense_block
            return self.new [ '', '', '', '', '', '']
          end
        end

        ##
        #--
        # TODO:  I dream of this being generated dynamically through the
        # VerbvectorGenerator for more dynamicity.  This would require a richer DSL in
        # VerbvectorGenerator, but would be totally awesome if we could describe this
        # language in a DSL.
        #++
        ##

        ##
        # --
        # This structure is used to define the methods that will be allowed to
        # access the @results array.  The key is the "canonical" name:
        # (person)(number).  This needs to be flexibly supported.  This key
        # map to a hash that contains the keys :aliases (for aliases to that
        # particular "canonical") method as well as a Proc that should return
        # the proper value for the "canonical" method (and therefore, by means
        # of alias, also to the "aliased" methods).  "Canonical" methods will
        # be added to an array accessed by "tb_canonical_accessors."  Aliases
        # will be accesed by "tb_noncanonical_accessors."  The aggregate is
        # accesed by "tb_accessors."
        #++
        ##

        # Describes the methods that are to be provided to instances as means
        # for accessing the contents of the @results hash.
        ACCESSOR_HASH = {
          :first_person_singular_number => {
            :aliases => [:singular_number_first_person],
            :returns => lambda{ @results[0] }
          },
          :second_person_singular_number => {
            :aliases => [:singular_number_second_person],
            :returns => lambda{ @results[1] }
          },
          :third_person_singular_number => {
            :aliases => [:singular_number_third_person],
            :returns => lambda{ @results[2] }
          },
          :first_person_plural_number => {
            :aliases => [:plural_number_first_person],
            :returns => lambda{ @results[3] }
          },
          :second_person_plural_number => {
            :aliases => [:plural_number_second_person],
            :returns => lambda{ @results[4] }
          },
          :third_person_plural_number => {
            :aliases => [:plural_number_third_person],
            :returns => lambda{ @results[5] }
          }
        }

        def self.add_acc_canonical(s); @tb_canonical_accessors << s; end # :nodoc:
        def self.add_acc_alias(s); @tb_alias_accessors << s; end # :nodoc:

        ACCESSOR_HASH.each_pair do |k,h|
          define_method k, h[:returns]
          self.add_acc_canonical k
          h[:aliases].each{|a| alias_method a, k; self.add_acc_alias a}
        end

        @tb_accessors = @tb_canonical_accessors + @tb_alias_accessors


        # Idea from Mike Perham (6/1/2011):  Add a way to leave a note that
        # describes, in English, the signification of the given tense.  Good
        # idea.

        attr_reader :meaning

        # === ARGUMENTS
        #
        # *r:* :: An Array (or something that can respond to to_a) containing 0-6
        #         elements that will be mapped into the 2*3 matrix of Latin verb person /
        #         number specifications.
        # === RETURNS
        #
        #  Nothing
        ##
        def initialize(r, opts={})
          begin
            unless r.class.is_a?  Array
              raise if r.nil?
              r = r.to_a
            end
            @results = r.map{|v| Linguistics::Latin::Phonographia.fix_macrons v}
            @meaning = opts[:meaning] if opts[:meaning]
          rescue => e
            raise e, "TenseBlock failed to initialize correctly. passed #{r.nil?}"
          end
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
        def TenseBlock.json_create(o)
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
        # Add array empty? compatibility
        #
        ##
        def empty?; return @results.empty?; end

        ##
        #
        # Add a sensible string display
        #
        ##
        def to_s; return self.to_a.to_s; end

        ##
        # Return whether the result arrays is empty of words
        ##
        def wordless?
          !@results.all?{ |r| r =~ /\w/ }
        end

        ##
        #
        # Provide a method_missing so that ambiguous cases can be resolved
        #
        ##
        def method_missing(symbol, *args)
          returnArray = []
          self.class.class_eval{@tb_canonical_accessors}.grep(/#{symbol.to_s}/) do |s|
           returnArray.push(send s)
          end
          return returnArray unless returnArray.empty?
          raise
        end
      end
    end
  end
end

