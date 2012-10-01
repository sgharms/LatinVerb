# encoding:  UTF-8

require 'latinverb'
require 'linguistics/latin/verb/phonographia'

module Linguistics
  module Latin
    module Verb
      ##
      # == NAME
      #
      # Participles
      #
      # == DESCRIPTION
      #
      # This module contains the methods that, when mixed into a LatinVerb,
      # will provide it the ability to resolve its participles (verbal
      # adjectives).
      #
      # == REFERENCE
      #
      #    Allen and Greenough Se. 155:
      #
      #    The following Noun and Adjective forms are also included in the
      #    inflection of the Latin Verb:
      #
      #    a.  Four Participles, viz: --
      #    <em>Active</em>:  the Present and Future Participles
      #    <em>Passive</em>: the Perfect Participle and the Gerundive
      #    b.  The Gerund:  this is in form a neuter noun of the second
      #    declension used only in the oblique cases of hte singular.
      #    c.  The Supine:  this is in form a verbal noun of the fourth
      #    declension in the accusative (-um) and dative or ablative (-ū)
      #    singular
      #    ...
      #
      ##
      module Participles

     ##########################################
     # Participles
     ##########################################

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # A&G,158,a.  The Present Participle (ending in -ns) has commly the
     # meaning and use as the English participle in 'ing; as vocāns, calling.
     # For inflection see egēns, sec. 118
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
     def present_active_participle
       raise "Participial stem was nil" if  participial_stem.nil?
       endings=%w(ns ntis)
       return endings.collect{ |x| Linguistics::Latin::Phonographia.fix_macrons(participial_stem+x.chomp)}.join(', ')
     end

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # A&G,158,b.  The Future Participle (ending in -ūrus) is oftenest used to
     # express what is likely or about to happen:  as, rēctūrus, about to
     # rule...
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
     def future_active_participle
       # In case we have an irregular, or somehow already have a /ūrus$/ we shouldn't do this
       mybase = (@passive_perfect_participle =~ /ūru.$/) ?
         @passive_perfect_participle.gsub(/u[sm]$/,'')
       :
         @passive_perfect_participle.gsub(/u[sm]$/, "ūr")

       singular_endings=%w(us a um)
       return singular_endings.collect{|x| mybase+"#{x}".chomp}.join(', ')
     end

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # 158,c.  The Perfect Participle (ending in -tus, -sus) has two uses:
     #
     # 1.  It is sometimes equivalent to the English perfect passive
     # participle:
     #
     # as tеctus, sheltered; acceptus, accepted...; and often simply has an
     # adjective meaning:  as, acceptus, acceptable.
     #
     # 2.  It is used with the verb to be (esse) to form certain tenses of the
     # passive:  as, vocātus est, he was (has been) called.
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
     def perfect_passive_participle
       mybase=@passive_perfect_participle.sub(/u[sm]$/,'')
       singular_endings=%w(us a um)
       return singular_endings.collect{|x| mybase+"#{x}".chomp}.join(', ')
     end

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # <em>See</em>:  Gerundive
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
     def future_passive_participle
       mybase = participial_stem+"nd"
       singular_endings=%w(us a um)
       return singular_endings.collect{|x|Linguistics::Latin::Phonographia.fix_macrons( mybase+"#{x}".chomp)}.join(', ')
     end

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # A&G, 158,d.
     #
     # The Gerundive (ending in -ndus) has two uses:
     #
     # 1.  ...an adjective implying obligation...
     #
     # 2.  In the oblique cases the Gerundive commonly has the same meaning as
     # the Gerund ... for examples see sec. 503
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
     def gerundive
       self.future_passive_participle
     end

     ##
     #--
     # The gerund is a verbal noun (loving dancing, running) formed like the
     # gerundive, except that it only has four forms: the n. singular of the
     # gen, dative, acc, and abl (the oblique cases).  They are identical to
     # the corresponding cases of the gerundive but ae ative in meaning and
     # correspond to the english "-ing"
     #
     # Gerundive:  verbal achective
     # gerund:  verbal noun
     #
     # gerund only has oblique
     # gerundive is passive in meaning, gerund is active:
     #
     # A FUNNY THING I ALWAYS FORGET:
     #  studium legeni libros ==>  studium librorum legendorum
     #  discimus legendo libros ==>  discimus libris legendis
     #
     #  -- Source, Wheelock
     #++
     ##
     #alias_method :gerund, :gerundive
       def gerund
         b = gerundive.sub( /.*\s+(.*)um.*$/, "\\1" )
         b += "ī, ō, etc."
         return b
       end
      end
    end
  end
end
