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
