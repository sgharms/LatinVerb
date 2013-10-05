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
    module Phonographia
      MACRON_TABLE = {
        "\xc4\x81" => 'a',
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
        "Ū" => 'U'
      }

      class << self
        def fix_macrons(s)
          s = mrt_at_end_of_word(s)
          s = macron_before_vowel(s)
          s = macron_before_nd(s)
          s
        end

        def mrt_at_end_of_word(s)
          if s =~ /^(.*)([āēīōūĀĒĪŌŪ])([mrt])$/i
            return $1 + MACRON_TABLE[$2] + $3
          end
          s
        end

        def macron_before_vowel(s)
           if s =~ /(.*)([āēīōūĀĒĪŌŪ])([āēīōūĀĒĪŌŪaeiouAEIOU])(.*)/i
             return self.fix_macrons $1 + MACRON_TABLE[$2] + $3 + $4
           end
          s
        end

        def macron_before_nd(s)
          if s =~ /n[td]/
            mutaturum = s.split(//)
            mutatum = []
            mutaturum.each_with_index do |e, i|
              if ( e == "n" && mutaturum[i+1].match(/[td]/) && !MACRON_TABLE[mutaturum[i-1]].nil? )
                mutatum[i-1] = MACRON_TABLE[mutaturum[i-1]]
              end
              mutatum << e
            end
            return mutatum.join ''
          end
          s
        end
      end

      def fix_macrons(s)
        Linguistics::Latin::Phonographia.fix_macrons(s)
      end
    end
  end
end
