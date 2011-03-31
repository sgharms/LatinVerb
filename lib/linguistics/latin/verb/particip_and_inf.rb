# encoding:  UTF-8

require 'latinverb'
require 'linguistics/latin/verb/phonographia'

module Linguistics 
  module Latin 
    module Verb 
      ##
      # == NAME
      #
      # ParticiplesAndInfinitives
      #
      # == DESCRIPTION
      #
      # This module contains the methods that, when mixed into a LatinVerb,
      # will provide it the ability to resolve its participles (verbal
      # adjectives) and infinitives.
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
      #    <em>From the footnotes</em>
      #
      #    1.  The Infinitive is strictly th elocative case of an abstract
      #    noun, expressing the action of the verb (cf. sec. 451)
      #    2.  The Participles are adjectives in inflection and meaning, but
      #    have the power of verbs in construction and in distinguishing time.
      # 
      # <b>NOTE</b>:  Elsewhere, particularly in Wheelock, the gerundive is called
      # the "perfect passive participle."
      #
      ##
      module ParticiplesAndInfinitives

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
       raise ("Bad nil") if  @participial_stem.nil?
       endings=%w(ns ntis)
       return endings.collect{ |x| Linguistics::Latin::Phonographia.fix_macrons(@participial_stem+x.chomp)}.join(', ')
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
       mybase=@pass_perf_part.gsub(/u[sm]$/, "ūr")
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
       mybase=@pass_perf_part.sub(/u[sm]$/,'')
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
       mybase = @participial_stem+"nd"
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
     alias_method :gerund, :gerundive 

     ##########################################
     # Infinitives
     ##########################################
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
       return @pres_act_inf
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
       return @first_pers_perf+"sse"
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
       if @classification == Linguistics::Latin::Verb::VerbTypes::First
         return  @pres_act_inf.gsub(/(.*)e$/,"\\1\xc4\xab")
       end 
       if @classification == Linguistics::Latin::Verb::VerbTypes::Second
         return @pres_act_inf.gsub(/(.*)e$/,"\\1\xc4\xab")
       end    
       if @classification == Linguistics::Latin::Verb::VerbTypes::ThirdIO
           return @pres_act_inf.gsub(/(.*)ere$/,"\\1\xc4\xab")
       end 
       if @classification == Linguistics::Latin::Verb::VerbTypes::Third
           return @pres_act_inf.gsub(/(.*)ere$/,"\\1\xc4\xab")
       end 
       if @classification == Linguistics::Latin::Verb::VerbTypes::Fourth
         return @pres_act_inf.gsub(/(.*)e$/,"\\1\xc4\xab")
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
