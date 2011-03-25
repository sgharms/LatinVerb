# encoding: UTF-8

module Linguistics 
  module Latin 
    ##
    #
    # The Phonographia module handles the phonography of written Latin:  how
    # the sound of Latin is written.  In particular, the sounds that need
    # special notation are the vowels which may bear a long ("ā") or short
    # ("a") quantity.
    #
    # When forming Latin words from heuristic ( as LatinVerb does ), certain
    # phonographical structures arise that one does not see in the language as
    # practiced by humans.  For example, given "amāre," the stem is "amā."
    # When the heuristic  postpends "t" to get the present, indicative, third
    # person singular, the result is "amāt," which, by rules of Latin
    # phonology, must be made to bear a short sound in the ultimate vowel.
    # This state is _phonographically_ notes as "amat."  This module
    # implements the appropriate rules for proper phonetic compliance.
    # 
    ##
    module Phonographia
      class << self
       # === DESCRIPTION
       #
       # Latin has several rules pertaining to how long sounds must behave
       # based on their neighboring characters.  The rules that +fix_macrons+
       # tests are the following
       #
       # === RULES
       #
       # <b>Rule 1: </b>:: m/r/t at end of line shortens preceding vowel
       # <b>Rule 2: </b>:: macron-bearing vowel  before vowel, regardless of
       #                   its quantity
       # <b>Rule 3: </b>:: macron-bearing vowel before  /n[td]/ anywhere in the string
       #
       # === ARGUMENTS
       #
       # +s+ :: a string which needs to be processed for Latin phonographic
       #             compliance
       #
       # === RETURNS
       #
       # String with consonants properly converted
       #
       # === EXAMPLE
       #
       # fix_macrons(fabām) #=> fabam ( Rule 1 )
       # fix_macrons(cāīō)  #=> caiō  ( Rule 1, Rule 2 )
       #
       ##
       def fix_macrons(s)
         raise if s.nil?
         return "" if s.empty?
         macron_table = {"\xc4\x81" => 'a', 
                         "\xc4\x93" => 'e',
                         "\xc4\xab" => 'i',
                         "\xc5\x8d" => 'o',
                         "\xc5\xab" => 'u',
                         "\xc4\x80" => 'A',
                         "\xc4\x92" => 'E',
                         "\xc4\xaa" => 'I',
                         "\xc5\x8c" => 'O',
                         "\xc5\xaa" => 'U',
                                "ā" => 'a',
                                "ē" => 'e',
                                "ī" => 'i',
                                "ō" => 'o',
                                "ū" => 'u',
                                "Ā" => 'A',
                                "Ē" => 'E',
                                "Ī" => 'I',
                                "Ō" => 'O',
                                "Ū" => 'U',
                        }


       # m/r/t at end of line shortens preceding vowel
       if s =~ /^(.*)([āēīōūĀĒĪŌŪ])([mrt])$/i
         s = $1 + macron_table[$2] + $3
       end

       # macron before vowel
       if s =~ /(.*)([āēīōūĀĒĪŌŪ])([āēīōūĀĒĪŌŪaeiouAEIOU])(.*)/i
        s = self.fix_macrons $1 + macron_table[$2] + $3 + $4
       end

       if s=~ /n[td]/
         # n[td]
         mutaturum = s.split //
         mutatum = []
         mutaturum.each_with_index do |e, i|
           if ( e == "n" and 
               mutaturum[i+1] =~ /[td]/ and 
               not macron_table[mutaturum[i-1]].nil? )
              mutatum[i-1]=macron_table[mutaturum[i-1]]
           end
            mutatum << e
         end

         return mutatum.join ''
       end

       return s
      end
    end
    end
  end
end
