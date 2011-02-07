# encoding: UTF-8

module Linguistics 
  module Latin 
    module Phonographia
      class << self
       def fix_macrons(s)
         raise if s.nil?
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
