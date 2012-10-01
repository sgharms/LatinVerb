# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2:
#
#------------------------------------------------------------------------------
# DEPENDENCIES
#------------------------------------------------------------------------------
# External dependencies
require 'verbvector'
require 'yaml'
require 'json'
require 'active_support'

### {{{
#--
# Internal dependencies
# If the library is in the latin/verb, then it is a feature of the actual
# Latin language as abstracted into Ruby.  If it is in the latin/verb/latinverb directory, it is part
# of the mechanics of the representation of that language as Ruby, i.e. this
# program.  It's the difference between "This is part of Latin" and "This is
# Part of the machinery I use to represent Latin in Ruby."
#++
### }}}

# Latin Language Rules
require 'linguistics/latin/verb/classification_types'# {{{
require 'linguistics/latin/verb/tense_block'
require 'linguistics/latin/verb/participle_block'
require 'linguistics/latin/verb/infinitive_block'
require 'linguistics/latin/verb/imperative_block'
require 'linguistics/latin/verb/tense_definitions/impersonal'
require 'linguistics/latin/verb/tense_definitions/invariant'
require 'linguistics/latin/verb/tense_definitions/first'
require 'linguistics/latin/verb/tense_definitions/second'
require 'linguistics/latin/verb/tense_definitions/third'
require 'linguistics/latin/verb/tense_definitions/third_io'
require 'linguistics/latin/verb/tense_definitions/fourth'
require 'linguistics/latin/verb/tense_definitions/irregular'
require 'linguistics/latin/verb/deponent_tense_methods'
require 'linguistics/latin/verb/supine'
require 'linguistics/latin/verb/phonographia'
require 'linguistics/latin/verb/constants'
require 'linguistics/latin/verb/infinitives'
require 'linguistics/latin/verb/participles'
require 'linguistics/latin/verb/irregulars'# }}}

# LatinVerb design
require 'linguistics/latin/verb/latinverb/impersonal'# {{{
require 'linguistics/latin/verb/latinverb/irregular'
require 'linguistics/latin/verb/latinverb/semideponent'
require 'linguistics/latin/verb/latinverb/deponent'
require 'linguistics/latin/verb/latinverb/latinverb_classifier'
require 'linguistics/latin/verb/latinverb/latinverb_pp_extractor'
require 'linguistics/latin/verb/latinverb/latinverb_input_sanitizer'
require 'linguistics/latin/verb/latinverb/defective_checker'
require 'linguistics/latin/verb/latinverb/latin_verb_type_evaluator'
require 'linguistics/latin/verb/latinverb/classmethods'
require 'linguistics/latin/verb/latinverb/verbvector_description'
require 'linguistics/latin/verb/latinverb/metaprogramming'
require 'linguistics/latin/verb/latinverb/validation'
require 'linguistics/latin/verb/latinverb/data'
require 'linguistics/latin/verb/latinverb/display'# }}}

require 'latinverb/version'# {{{
require 'latinverb/chart.rb'# }}}

=begin rdoc
# {{{
==DESCRIPTION

Linguistics is a module that forms a primordial node for storing Modules and classes dealing with linguistics.  The namespace is immediately sub-divided by language (e.g. Latin, Spanish) then part of speech (e.g. Noun, Verb) or function (e.g. Phonographia).
# }}}
=end

module Linguistics
  # Generalized module for handling linguistics related to Latin
  module Latin
    # Generalized module for handling linguistics related to Latin's verbal aspects
    module Verb
      ### {{{
      # == SYNOPSIS# {{{# {{{
      #
      # Abstraction of a Verb in the Latin language.
      ## }}}
      # == DESCRIPTION# {{{
      #
      # LatinVerb is:
      # * a tool to help the student of Latin understand the rules of
      #   conjugation's heuristics by presenting said heuristics in Ruby
      # * a way to get out of having to lug the 501 Latin Verbs book around
      #   (when wrapped in an application ;) )
      # * a way to discover some of the interesting metacongnitive structures
      #   between natural language and programming language
      # * <em>...and so much more...</em>
      ## }}}
      # === OPERATION# {{{
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
      ## }}}
      # === EXAMPLE# {{{
      #
      # <pre>
      # to_love = LatinVerb.new("amō amāre amāvī amatum")
      # to_love.active_voice_indicative_mood_present_tense_second_person_singular_number #=> amās
      # to_love.active_voice_indicative_mood_present_tense_third_person_singular_number #=> amat
      # </pre>
      ## }}}
      # === EXPLICATION# {{{
      #
      # Considering the above example, when the object was insantiated, it
      # realized what its conjugation was, realized what its stem ("amā") was,
      # and then added to itself support for
      # <tt>active_voice_indicative_mood_present_tense</tt> which is defined
      # as "take the stem and postpend "ō, s, t, mus, tis, nt" to the stem and
      # return it as an array.  It is through (mis-?)use of method_missing
      # that this simple "vector" method for interfacing with a verb is
      # possible.  <em>Puto hoc bonum esse</em>.
      ## }}}
      # === MACRONS / QUANTITY# {{{
      #
      # In reference texts, quanitiy of vowel duration ("long" or "short") is
      # marked with a macron.  *LatinVerb assumes it will be provided strings
      # with macrons*.  This makes sense as per the previous section, the
      # conjugation is done by heuristic.  What isn't there cannot be altered.
      # <em>Si hoc non aderit, non mutabitur</em>.  To make this easier I
      # wrote the MacronConversion library which supports conversion of
      # LaTeX-styled ASCII macron transgraphia (e.g. \={a} => ā).
      ## }}}
      # === REFERENCE# {{{
      ## }}}
      # ==== Voices# {{{
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
      ## }}}
      # ==== Moods# {{{
      #
      # a.  The Indicative Mood is used for most <em>direct assertions</em>
      # and <em>interrogations</em>
      # b.  The Subjunctive Mood has many idiomatic uses, as in
      # <em>commands</em>, <em>conditions</em>, and various <em>dependent
      # clauses</em>.
      # c.  The Imperative is used for <em>exhortation</em>,
      # <em>entreaty</em>, or <em>command</em>; but the Subjunctive is often
      # used instead
      ## }}}
      # === WORKS CITED# {{{
      #
      # Allen, J.H.  Allen and Greenough's New Latin Grammar.  Dover,
      # Mineola: 2006.  Cited herein as "A&G."
      #
      # Wheelock, Frederic M.  Wheelock's Latin.  Collins, New York: 2005.
      # Cited herein as "Wheelock."# }}}# }}}
      #
      ### }}}
      class LatinVerb
        # Modules used to validate the input in initialize# {{{
        include Linguistics::Latin::Verb::Validation
        include Linguistics::Latin::Verb::Participles
        include Linguistics::Latin::Verb::Infinitives
        # }}}

        # Attributes for storing submitted data.  This will help remember the origin state# {{{
        attr_reader :original_string

        # Attributes for storing calculated status.
        attr_reader :verb_methods

        # Access the Module that provides all the methods
        attr_reader :latin_verbvector_generator, :latin_verb_methods# }}}

        ### {{{
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
        # activity.  In the case of extending to support irregular verbs,
        # #_irregular_handler is a critical path to explore.
        #
        # == TODO
        #
        # * Array support for the argument
        #
        ### }}}
        #
        def initialize(data)# {{{
          raise LatinVerbInitializationError if data.nil?

          ### {{{
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
          ### }}}
          @latin_verbvector_generator =
            Linguistics::Verbs::Verbvector::VerbvectorGenerator.new(
              &Linguistics::Latin::Verb::LatinVerb::LATIN_VERBVECTOR_DESCRIPTION )

          # We're restoring a standard verb from JSON
          data = data['original_string'] if init_data_is_a_hash_of_a_regular_restorable_verb(data)

          if data.is_a? String
            @sanitizer            = LatinVerbInputSanitizer.new data
            @original_string      = @sanitizer.to_s
            @classifier           = LatinVerbClassifier.new @original_string
            @prin_parts_extractor = LatinVerbPPExtractor.new @sanitizer.to_s, @classifier
            @verb_type            = LatinVerbTypeEvaluator.new first_person_singular, present_active_infinitive, @classifier

            load_tense_methods
            generate_methods_for_accessing_tense_blocks_from_tense_methods_components
            include_classification_specific_mixins
            check_and_mutate_defectives
          end
        end# }}}

        ######################################################################
        # Instance methods
        ######################################################################
        ##

        def present_only?# {{{
          @present_only ||= @classifier.present_only?
        end# }}}
        def short_class# {{{
          return classification.to_s.gsub(/.*::(\w+)$/,"\\1")
        end# }}}

        ### {{{
        #
        # Returns the four principal parts and regularity designation
        ### }}}
        def to_s# {{{
          return sprintf("%s [%s]", short_class, original_string)
        end# }}}

        ### {{{
        #
        # When working in irb or LatinIRB it's good to find out what the
        # instance methods are on this# }}}
        def instance_methods# {{{
          @latin_verbvector_generator.vector_list
        end# }}}

      def regular?# {{{
        @classifier.regular?
      end# }}}

      def irregular?# {{{
        @classifier.irregular?
      end# }}}

      def classification# {{{
        @classifier.classification
      end# }}}

      def verb_type# {{{
        @verb_type.inspect
      end# }}}

      def stem# {{{
        unless classified_as.irregular?
          @stem ||= @prin_parts_extractor.stem
        end
      end# }}}

      def conjugation# {{{
        classification.to_s
      end# }}}

      def principal_parts# {{{
        @principal_parts ||= @prin_parts_extractor.principal_parts
      end# }}}

      def classified_as# {{{
        return @classifier
      end# }}}

      def first_person_singular# {{{
        @first_person_singular ||= @prin_parts_extractor.first_person_singular
      end# }}}

      def present_active_infinitive# {{{
        @present_active_infinitive ||= @prin_parts_extractor.present_active_infinitive
      end# }}}

      def first_person_perfect# {{{
        @first_person_perfect ||= @prin_parts_extractor.first_person_perfect
      end# }}}

      def passive_perfect_participle# {{{
        @passive_perfect_participle ||= @prin_parts_extractor.passive_perfect_participle
      end# }}}

      def participial_stem# {{{
        @participial_stem ||= @prin_parts_extractor.participial_stem
      end# }}}

# ===============================================================================

     private

     def load_tense_methods# {{{
       load_tense_methods_that_do_not_vary_by_verb_type
       load_tense_methods_based_on_verb_type
     end# }}}

     def load_tense_methods_that_do_not_vary_by_verb_type# {{{
       self.extend Linguistics::Latin::Verb::TenseDefinitions::Invariant
     end# }}}

     def load_tense_methods_based_on_verb_type #{{{
       # Turn Linguistics::Latin::Verb::VerbTypes::First into
       # Linguistics::Latin::Verb::TenseDefinitions::First and extend with it
       mod_path = @verb_type.inspect.to_s
       return if mod_path.empty?
       mod_path.sub!('VerbTypes', 'TenseDefinitions' )
       the_mod = mod_path.split('::').inject(Object) do |mod, class_name|
         mod.const_get(class_name)
       end
       self.extend the_mod
     end# }}}

     def verify_generated_tense_list# {{{
       # Given the use of method_missing to handle resolution, it's wise to
       # make sure that every cluster method /is/ actually defined.
       @tense_list.each do |m|
         raise "FAILURE:  Critical method #{m} was not defined." unless
           (self.respond_to? m.to_sym)
       end
     end# }}}

      def init_data_is_a_hash_of_a_regular_restorable_verb(data)# {{{
        (data.is_a?(Hash) && !data['irregular'] && data.has_key?('original_string'))
      end# }}}

      def generate_methods_for_accessing_tense_blocks_from_tense_methods_components# {{{
        self.extend @latin_verbvector_generator.method_extension_module
        @tense_list =
                      @latin_verbvector_generator.cluster_methods[:tense_list].call
        verify_generated_tense_list
      end# }}}

        def include_classification_specific_mixins# {{{
          the_mod = if classified_as.impersonal?
             Linguistics::Latin::Verb::LatinVerb::Impersonal
          elsif classified_as.irregular?
             Linguistics::Latin::Verb::LatinVerb::Irregular
          elsif  classified_as.deponent?
             Linguistics::Latin::Verb::LatinVerb::Deponent
          elsif classified_as.semideponent?
             Linguistics::Latin::Verb::LatinVerb::Semideponent
          elsif classified_as.present_only?
             Linguistics::Latin::Verb::LatinVerb::PresentOnly
          end

          return unless the_mod

          # Tell the instance to pull in the instance methods in the module by
          # extending itself.
          self.instance_eval do
            self.extend the_mod
          end

        end# }}}

      def check_and_mutate_defectives# {{{
        is_defective = Linguistics::Latin::Verb::LatinVerb::DefectiveChecker::is_it_defective?(self)
        if is_defective
          @classifier.set_as_defective
          remove_perfect_tenses
        end
      end# }}}

      def remove_perfect_tenses# {{{
        # Get perfect system methods
        tense_blocks_to_eclipse =
          self.methods.grep( /^(active|passive).*(_|past|future)perfect_/ )

        # Re-assign their methods to point to a blank TenseBlock, thus
        # eclipsing any values thatm ight come in.
        tense_blocks_to_eclipse.each do |s|
          singleton_class.class_eval do
            define_method s do
              return TenseBlock.null_tense_block
            end
          end
        end
      end# }}}
      end
    end
  end
end
