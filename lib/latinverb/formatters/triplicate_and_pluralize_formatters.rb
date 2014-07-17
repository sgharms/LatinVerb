#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Formatters
          class TriplicateAndPluralizeFormatters
            def self.pluralize_participial_listing(participle)
              x = triplicate_and_genderize(participle)
              x.sub!(/us,/,   'ī,' )
              x.sub!(/a,/,    'ae,')
              x.sub!(/um.*$/, 'a'  )
            end

            def self.triplicate_and_genderize(s)
              stem = s.sub(/^(.*)um$/,"\\1")
              [ stem + 'us',
                stem + 'a',
                s
              ].join(', ')
            end
          end
        end
      end
    end
  end
end
