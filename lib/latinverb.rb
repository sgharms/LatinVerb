# encoding: UTF-8
#------------------------------------------------------------------------------ 
# DEPENDENCIES
#------------------------------------------------------------------------------ 
# External dependencies
require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'

##
#--
# Internal dependencies
# If the library is in the latin/verb, then it is a feature of the actual
# Latin language as abstracted into Ruby.  If it is in the latin/verb/latinverb directory, it is part
# of the mechanics of the representation of that language as Ruby, i.e. this
# program.  It's the difference between "This is part of Latin" and "This is
# Part of the machinery I use to represent Latin in Ruby."
#++
## 

require 'linguistics/latin/verb/classification_types'
require 'linguistics/latin/verb/tense_methods'
require 'linguistics/latin/verb/deponent_tense_methods'
require 'linguistics/latin/verb/supine'
require 'linguistics/latin/verb/phonographia'
require 'linguistics/latin/verb/constants'
require 'linguistics/latin/verb/infinitives'
require 'linguistics/latin/verb/participles'
require 'linguistics/latin/verb/irregulars'

require 'linguistics/latin/verb/latinverb/classmethods'
require 'linguistics/latin/verb/latinverb/metaprogramming'
require 'linguistics/latin/verb/latinverb/validation'
require 'linguistics/latin/verb/latinverb/data'
require 'linguistics/latin/verb/latinverb/display'

=begin rdoc

==DESCRIPTION

Linguistics is a module that forms a primordial node for storing Modules and classes dealing with lingustics.  The namespace is immediately sub-divided by language (e.g. Latin, Spanish) then part of speech (e.g. Noun, Verb) or function (e.g. Phonographia).  

=end

module Linguistics
  # Generalized module for handling lingustics related to Latin
  module Latin
    # Generalized module for handling lingustics related to Latin's verbal aspects
    module Verb
      ##
      # == SYNOPSIS
      #
      # Abstraction of a Verb in the Latin language.
      #
      # == DESCRIPTION
      #
      # LatinVerb is:
      # * a tool to help the student of Latin understand the rules of
      #   conjugation's heuristics by presenting said heuristics in Ruby 
      # * a way to get out of having to lug the 501 Latin Verbs book around
      #   (when wrapped in an application ;) )
      # * a way to discover some of the interesting metacongnitive structures
      #   between natural language and programming language
      # * <em>...and so much more...</em>
      #
      # === OPERATION
      #
      # LatinVerb operates by instantiating a LatinVerb based on a string
      # containing the "four principal parts" that are used to describe a
      # Latin verb.  From this simple entry, one calls "vectors' upon the
      # object.  Vectors represent the unique, "fully-qualified" locus of a
      # conjugated form.  A feature that was of paramount importance in its
      # implementation was that the conjugation <b>should occur by
      # heruristic</b> in the exact same way that <b>humans have been
      # taught</b> in Latin classes for _milennia_!
      #
      # An example should illustrate:
      #
      # === EXAMPLE
      #
      # <pre>
      # to_love = LatinVerb.new("amō amāre amāvī amatum")
      # to_love.active_voice_indicative_mood_present_tense_second_person_singular_number #=> amās
      # to_love.active_voice_indicative_mood_present_tense_third_person_singular_number #=> amat
      # </pre>
      #
      # === EXPLICATION
      #
      # Considering the above example, when the object was insantiated, it
      # realized what its conjugation was, realized what its stem ("amā") was,
      # and then added to itself support for
      # <tt>active_voice_indicative_mood_present_tense</tt> which is defined
      # as "take the stem and postpend "ō, s, t, mus, tis, nt" to the stem and
      # return it as an array.  It is through (mis-?)use of method_missing
      # that this simple "vector" method for interfacing with a verb is
      # possible.  <em>Puto hoc bonum esse</em>.
      #
      # === MACRONS / QUANTITY
      #
      # In reference texts, quanitiy of vowel duration ("long" or "short") is
      # marked with a macron.  *LatinVerb assumes it will be provided strings
      # with macrons*.  This makes sense as per the previous section, the
      # conjugation is done by heuristic.  What isn't there cannot be altered.
      # <em>Si hoc non aderit, non mutabitur</em>.  To make this easier I
      # wrote the MacronConversion library which supports conversion of
      # LaTeX-styled ASCII macron transgraphia (e.g. \={a} => ā).
      #
      #
      # === REFERENCE
      #
      # ==== Voices
      # A&G Sec. 156:  
      #
      # The Active and Passive Voices in Latin generally correspond to the
      # active and passive in English; but --
      #
      # a.  The passive voice often has a reflexive meaning: --
      # b.  Many verbs are passive in form, but active or reflexive in
      # meaning.  These are called Deponents (sec 190.)...
      # c.  Some verbs with active meaning have the passive form in the
      # perfect tenses; these are called Semi-Deponents
      #
      # ==== Moods
      #
      # a.  The Indicative Mood is used for most <em>direct assertions</em>
      # and <em>interrogations</em>
      # b.  The Subjunctive Mood has many idiomatic uses, as in
      # <em>commands</em>, <em>conditions</em>, and various <em>dependent
      # clauses</em>.
      # c.  The Imperative is used for <em>exhortation</em>,
      # <em>entreaty</em>, or <em>command</em>; but the Subjunctive is often
      # used instead
      #
      # === WORKS CITED
      #
      # Allen, J.H.  Allen and Greenough's New Latin Grammar.  Dover,
      # Mineola: 2006.  Cited herein as "A&G."
      #
      # Wheelock, Frederic M.  Wheelock's Latin.  Collins, New York: 2005.  
      # Cited herein as "Wheelock."
      #
      ## 
      class LatinVerb
        # Modules used to validate the input in initialize
        include Linguistics::Latin::Verb::Validation
        include Linguistics::Latin::Verb::Participles
        include Linguistics::Latin::Verb::Infinitives
 
        # Attributes for storing submitted data.  This will help remember the origin state
        attr_reader :original_string
        
        # Attributes for storing calculated status.
        attr_reader :classification, :classification_error, :principal_parts,
        :four_pp, :irregular, :stem, :first_pers_singular, :pres_act_inf,
        :first_pers_perf, :pass_perf_part, :participial_stem, :verb_methods,
        :data_structure

        # Access the Module that provides all the methods
        attr_reader :latin_verbvector_generator, :latin_verb_methods

        alias_method :conjugation, :classification
        alias_method :irregular?, :irregular

        ##
        #
        # The constructor for a Latinverb
        #
        # ===ARGUMENTS
        #
        # *s:* :: +s+ is class-tested and supports String or Hash classes,
        # with the standard path having been designed to accept a string
        # containing 4 words ("four principal parts").  Latin's principal
        # irregular verbs are also accepted (see CONSTANTS) as possible
        # entries.  +s+ also accepts a Hash as input.  This is used for
        # deserialization from JSON which initialized based on a Hash.
        #
        # == SEE ALSO
        #
        # #initialize does very little work.  Therefore special attention
        # should be paid to the #_init_by_string and _add_vector_methods.
        # These are the workhorses of this class and do most of the decoration
        # activity.  In the case of extending to support irregular verbs, #_irregular_handler is a critical path to explore.
        #
        # == TODO
        #
        # * Array support for the argument
        #
        ##
        def initialize(s)
          raise SyntaxError if s.nil?

          if s.class == String
            _init_by_string(s)
            _irregular_handler if @irregular
            _deponent_handler  if ( @deponent || @semideponent )
          end

          if (s.class == Hash )
            if (s['irregular'] == false and 
                s.has_key?('original_string'))
              # We're restoring a standard verb
              _init_by_string(s['original_string'])
            end
          end

          if s.class == Array
            # TODO:  Fill this out.  
          end
          
          # Load up the specialized vector complement of methods
          _add_vector_methods

          # Given the use of method_missing to handle resolution, it's wise to
          # make sure that every cluster method /is/ actually defined.
          @tense_list.each do |m|
            raise "FAILURE:  Critical method #{m} was not defined." unless 
              (self.respond_to? m.to_sym)
          end

          # Placeholder the data structure that holds all the answers (a hash
          # of TenseBlocks).  This may be the typical case, but the
          # calculation is an expensive operation compared to the simple
          # vector query, so this won't actually get defined unless #to_hash
          # is called (cf. latinverb/display).
          # TODO:  This probably needs some work, make it useful in the
          # to_json methods

          @data_structure = {}

          # In a bit of cleverness, if the verb is deponent, we have built out
          # this verb as if it were regular, but we have also created a
          # @proxyVerb which is the active 'pseudo verb' corresponding to this
          # verb.  We should be able to take this verb's active formulations
          # and set their results to the @proxyVerb's passive formulations
          #
          # Ergo:  miror/mirari/miratus =~ miro/mirare/JUNK/miratus
          # Therefore make a LatinVerb.new(miro/mirare/JUNK/miratus).  Take
          # its passives and set them to this verb's actives.  This is
          # actually what students do heuristically in Latin classes.
          apply_deponent_masking if @deponent

          # Previously @deponent and @semideponent followed the same paths,
          # but in semideponents, the "present system" is handled as normal
          # (completed by _add_vector_methods, supra).  We need only mask, as
          # A&G #192 says: "the completed methods" i.e. the perfect system.
          apply_semideponent_masking  if @semideponent
        end

        ######################################################################
        # Instance methods
        ######################################################################
         
        ##
        #
        # Imports replacements to the standard tense_methods and thus
        # overwrites the old method definitions defined by verbvector
        #
        ##
        def apply_semideponent_masking
          self.singleton_class.class_eval do
            include Linguistics::Latin::Verb::DeponentTenseMethods
          end
        end

        ##
        #
        # Top-level method used to call the sub-methods which create a facade so that
        # active_ vectors can be called on a deponent which actually forwards that
        # call to a "fake" non-deponent (+@proxyVerb+) whose passives fit the correct
        # morphology
        #
        # It calls the following methods, each of which applies the masking to a
        # certain collection of vectors:
        #
        # * +deponent_swap+ :: active_voice* remaps "standard" calls like
        # +active_voice_indicative_mood_present_tense...+
        # * +deponent_imperative_mutations+ :: masks the imperatives
        # * +deponent_participle_mutations+ :: masks the participles
        # * +deponent_infinitive_mutations+ :: masks the infinitives
        #
        ##
        def apply_deponent_masking
          deponent_swap
          deponent_imperative_mutations
          deponent_participle_mutations
          deponent_infinitive_mutations
        end

        ##
        #
        # The deponent's imperatives require a bit of consideration.  They don't
        # follow the stem/stem+'ite' format.  
        #
        ##
        
        def deponent_imperative_mutations # :nodoc: 
          self.singleton_class.class_eval do
            def active_voice_imperative_mood_present_tense_second_person_singular_number
              return @proxyVerb.instance_variable_get '@pres_act_inf'
            end
            def active_voice_imperative_mood_present_tense_second_person_plural_number
              return @proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
            end
            def active_voice_imperative_mood_future_tense_second_person_singular_number
              k=@proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
              k.sub! /minī$/, ''
              k += 'tor'
              Linguistics::Latin::Phonographia.fix_macrons k
            end
          end
        end

        def deponent_participle_mutations # :nodoc: 
          self.singleton_class.class_eval do
            def present_active_participle
              return @proxyVerb.present_active_participle
            end

            def future_active_participle
              return @proxyVerb.future_active_participle
            end

            def perfect_active_participle
              return @proxyVerb.perfect_passive_participle
            end

            def future_passive_participle
              return @proxyVerb.future_passive_participle
            end

            # Mask the supine
            def supine
              return @proxyVerb.supine
            end
          end
        end

        def deponent_infinitive_mutations # :nodoc: 
          self.singleton_class.class_eval do
            def present_active_infinitive
              return @proxyVerb.send :present_passive_infinitive
            end
            def perfect_active_infinitive
              return @proxyVerb.send :perfect_passive_infinitive    
            end
            def future_active_infinitive
              return @proxyVerb.send :future_active_infinitive
            end
          end
        end

        ##
        # 
        # Swaps this verb's active_ vectors and replaces them with
        # @proxyVerb's passive_ vectors.  This is pretty darned sneaky. See
        # Also deponent_swap
        #
        ##
        def deponent_swap
          # First, get the methods that were defined in the proxy as passive

          storage = {}

          @proxyVerb.methods.grep(/^passive/).each do |pass|
            # Find the active correlate
            active_corr = pass.to_s.sub /^passive(.*)/, "active\\1"
            
            #  Keep @proxyVerb in the binding scope
            pV = @proxyVerb

            # In self, find the passive and save it's resultant object into a
            # hash for future use.
            self.singleton_class.class_eval do
              storage[active_corr.to_sym] = pV.send(pass) 
            end
          end

          # Take the stored hashes and define instance methods on self such
          # that we intercept the mixed-in methods ( C-c-c-combo breaker! ).
          storage.each_pair do |k,v|
            self.singleton_class.class_eval do
              define_method k, lambda { return v }
            end
          end
        end

        # Returns the "short" version, sans the module specifier.  in previous
        # versions, the classification was expressed as a String.  While this
        # had a certain amount of simplicity, building function is based on
        # these classifications seems a linkely future direction.
        #
        # Furthermore, it is not the case that these are actuallly Strings,
        # they are entities of an ontological sttus of their own and it seems
        # "off" to consider them as mere strings.
        def short_class
          return @classification.to_s.gsub(/.*::(\w+)$/,"\\1")
        end

        ##
        #
        # Returns the four principal parts and regularity designation
        ##
        def to_s
           return "#{self.class}: [EMPTY PP]" if @four_pp.nil?
           return self.class if @four_pp.empty?
           @four_pp.join(', ') + " [Irregular?: #{@irregular.to_s}]"
        end

        private

        def _deponent_handler
          @proxyVerb = Linguistics::Latin::Verb::LatinVerb.new @deponent_proxy
        end

        def _irregular_handler
          begin
            o = @original_string.gsub(/\s+/,'_')
            o_upcase_and_symbolic = ActiveSupport::Multibyte::Chars.new( o ).upcase.to_sym
            json_string = Linguistics::Latin::Verb.const_get o_upcase_and_symbolic 


            raise "Found a JSON string with null length!" if json_string.length <= 10
            revivified_data_structure = JSON.parse json_string
          rescue JSON::ParserError => e
            puts "We were unable to parse JSON for #{@original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please verify your syntax."
            raise e
          rescue NameError => e
            puts "We were unable to find a definition for #{@original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please provide one."
            raise e
          rescue => error
            warn "#{@original_string} was identified as irregular but did not have a definition provided."
            raise error
          end

          revivified_data_structure['tense_blocks'].each_pair do |k,v|
            singleton_class.class_eval do
              define_method k.to_sym do
                v
              end
            end
          end

          @irregular_infinitives = revivified_data_structure['infinitives']
          @irregular_participles = revivified_data_structure['participles']

          return if @irregular_infinitives.nil?
          return if @irregular_participles.nil?

          singleton_class.class_eval do
            def present_active_infinitive; return @irregular_infinitives.present_active_infinitive; end
            def present_passive_infinitive; return @irregular_infinitives.present_passive_infinitive; end
            def perfect_active_infinitive; return @irregular_infinitives.perfect_active_infinitive; end
            def perfect_passive_infinitive; return @irregular_infinitives.perfect_passive_infinitive; end
            def future_passive_infinitive; return @irregular_infinitives.future_passive_infinitive; end
            def future_active_infinitive; return @irregular_infinitives.future_active_infinitive; end
          end
          singleton_class.class_eval do
            def present_active_participle; return @irregular_participles.present_active_participle; end
            def future_active_participle; return @irregular_participles.future_active_participle; end
            def perfect_passive_participle; return @irregular_participles.perfect_passive_participle; end
            def future_passive_participle; return @irregular_participles.future_passive_participle; end
            def gerundive; return @irregular_participles.gerundive; end
            def gerund; return @irregular_participles.d; end
          end

        end

        def respondable_methods
        end

        def _init_by_string(s)
          # Store the original input
          @original_string = s
          @classification_error = nil

          # pre-validate the string
          self.valid?
          
          # If the error callback has been created, then call it
          @classification_error.call unless @classification_error.nil?

          # Derive from the original, valid string useful specifiers in handy data structures

          unless ( @deponent or @semideponent )
            _derive_parts_from_given_string s

            # Derive iVar from derived variables
            (@participial_stem ||= calculate_participial_stem) unless @irregular
          else
            fake_string = Linguistics::Latin::Verb::LatinVerb.create_pseudo_active_mask_for_deponent(s)
            #_derive_parts_from_given_string fake_string
            @deponent_proxy = fake_string
          end

        end

        def _add_vector_methods
          ## 
          # Generates all the methods to which a verb must be able to respond
          # by implementing Linguistics::Verbs::Verbvector::VerbvectorGenerator.
          #
          # This conforms to the definition provided in Allen & Greenough Sec.
          # 154:
          #
          #    Through its conjugation the Verb expresses Voice, Mood, Tense
          #    Person, and Number.
          #
          #    a.  The Voices are two:  Active and Passive
          #    b. The Moods are four: Indicative,Subjuncitve, Imperative, and
          #    Infinitive
          #
          #    ...
          #
          #    c.  The Tenses are six, viz: --
          #    1.  For continued action:  Present, Imperfect, Future
          #    2.  For completed action, Perfect, Pluperfect, Future Perfect
          #
          #    The Indicative Mood has all six tenses, but the Subjunctive has
          #    no future or future perfect and the Imperative has only the
          #    present and the future.  The Infinitive has the present, perfect,
          #    and future.
          #
          #    d. The Persons are three:  First, Secon, Third.
          #    e.  The Numbers are two:  Singular and Plural
          ##
          @latin_verbvector_generator = 
          Linguistics::Verbs::Verbvector::VerbvectorGenerator.new do
            language :Latin do
              all_vectors :start_with do
                 {
                  :voice =>  %w(active passive),
                  :mood  =>  %w(indicative subjunctive imperative)
                 }
              end
              vectors_that /.*_indicative_mood/ do
                {
                  :tense  => %w(present imperfect future
                                perfect pastperfect futureperfect)
                }
              end
              vectors_that /.*_subjunctive_mood/ do
                {
                  :tense => %w(present imperfect 
                                perfect pastperfect)
                }
              end
              vectors_that /.*_imperative_mood/ do
                {
                  :tense => %w(present future)
                }
              end
              all_vectors :end_with do
                {
                  :number => %w(singular plural),
                  :person => %w(first second third)
                }
              end
              exception :remove, :passive_voice_imperative_mood_present_tense
              exception :remove, :passive_voice_imperative_mood_future_tense
              cluster_on :tense, "as method", :tense_list
            end
          end

          # This provides methods of the form #{language_name}_#{fake_name}.
          # They are actually called sans #{language_name} so that
          # method_missing is called.
          @verb_methods = @latin_verbvector_generator.method_extension_module

          # Make sure all the cluster methods are defined.  Ensure we don't
          # get infinite stack method_missing lookups
          @tense_list = 
            @latin_verbvector_generator.cluster_methods[:tense_list].call

          # POWER-UP with the vector methods
          self.extend @verb_methods
        end

        def _derive_parts_from_given_string(s)
            @principal_parts      
            @first_pers_singular, 
            @pres_act_inf, 
            @first_pers_perf, 
            @pass_perf_part       = @four_pp = @principal_parts = s.split(/\s+/)
        end

        def calculate_participial_stem
           raise("@pres_act_inf was nil!") if  
             @pres_act_inf.nil? or @first_pers_singular.nil?

           if @pres_act_inf.to_s =~ /(.*ā)re$/
            return $1
          end 

          if @pres_act_inf.to_s =~ /(.*ē)re$/
            return $1
          end        

          if @pres_act_inf.to_s =~ /(.*)ere$/
            match=$1
            if @first_pers_singular =~ /iō/
              return match + "iē"  
            else
              return match + "e" 
            end       end 
        
          if @pres_act_inf.to_s =~ /(.*)īre$/
            return $1 + "iē" 
          end 
        end 
      end
    end
  end
end
