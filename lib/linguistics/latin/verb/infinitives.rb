# encoding:  UTF-8

require 'latinverb'
require 'linguistics/latin/verb/phonographia'

module Linguistics
  module Latin
    module Verb
      ##
      # == NAME
      #
      # Infinitives
      #
      # == DESCRIPTION
      #
      # This module contains the methods that, when mixed into a LatinVerb,
      # will provide it the ability to resolve its infinitives (verbal nouns).
      #
      # == REFERENCE
      #
      #    Allen and Greenough Se. 155:
      #
      #    <em>From the footnotes</em>
      #
      #    1.  The Infinitive is strictly the locative case of an abstract
      #    noun, expressing the action of the verb (cf. sec. 451)
      #
      #
      ##
      module Infinitives

        ##########################################
        # Infinitives
        ##########################################
        # Some very handy getter and setters, for serialization
        ##

        def infinitives
          return {
            :present_active_infinitive  => present_active_infinitive,
            :perfect_active_infinitive  => perfect_active_infinitive,
            :future_active_infinitive   => future_active_infinitive,
            :present_passive_infinitive => present_passive_infinitive,
            :perfect_passive_infinitive => perfect_passive_infinitive,
            :future_passive_infinitive  => future_passive_infinitive
          }
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To X"
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def present_active_infinitive
          return @present_active_infinitive
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To have X-d"
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def perfect_active_infinitive
          return @first_person_perfect+"sse"
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To be about to X"
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def future_active_infinitive
          return future_active_participle.sub(/,.*/,'') + " esse"
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To be X-d"
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def present_passive_infinitive
          if verb_type == Linguistics::Latin::Verb::VerbTypes::First
            return  @present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
          if verb_type == Linguistics::Latin::Verb::VerbTypes::Second
            return @present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
          if verb_type == Linguistics::Latin::Verb::VerbTypes::ThirdIO
            return @present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
          end
          if verb_type == Linguistics::Latin::Verb::VerbTypes::Third
            return @present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
          end
          if verb_type == Linguistics::Latin::Verb::VerbTypes::Fourth
            return @present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
          end
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To have been X-d"
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def perfect_passive_infinitive
          return perfect_passive_participle + " esse"
        end

        ##
        #
        # === GRAMMATICAL FUNCTION
        #
        #  A&G, 157,d:
        #
        #  The Infinitive is used chiefly as an indeclinable noun, as the subject
        #  or complement of another ver ( 452, 456.n)
        #
        #  "To be about to be X-d"
        #
        #  <b>Note:</b>  This form is exceedingly rare.  Wheelock notes that
        #  Romans preferred to use the 4th principal part + <b>fore</b>.
        #
        # === ARGUMENTS
        #
        # None
        #
        # === RETURNS
        #
        # Array of participles
        #
        ###
        def future_passive_infinitive
          return supine[:accusative] + " īrī"
        end
      end
    end
  end
end
