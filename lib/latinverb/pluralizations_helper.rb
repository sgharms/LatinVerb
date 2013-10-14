module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module PluralizationsHelper
          def pluralize_participial_listing(x)
            x.sub!(/us,/,   'ī,' )
            x.sub!(/a,/,    'ae,')
            x.sub!(/um.*$/, 'a'  )
          end

          def triplicate_and_genderize(s)
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
