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
      ##
      module ParticiplesAndInfinitives

     ##########################################
     # Participles
     ##########################################

     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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

     ##########################################
     # Infinitives
     ##########################################
     ##
     #
     # === GRAMMATICAL FUNCTION
     #
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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
     # TODO:  Find A&G Reference
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

   end
 end
end
end
