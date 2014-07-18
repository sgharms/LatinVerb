#encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        PARTICIPLE_METHODS = [
          :present_active_participle,
          :future_active_participle,
          :perfect_passive_participle,
          :future_passive_participle
        ]

        class Participler
          include Linguistics::Latin::Phonographia
          extend Forwardable

          def_delegators :@verb, :passive_perfect_participle, :participial_stem

          def initialize(verb)
            @verb = verb
          end

          def participle_methods
            [
              :participle_methods,
              :present_active_participle,
              :future_active_participle,
              :perfect_passive_participle,
              :future_passive_participle
            ]
          end

          def present_active_participle
            raise "Participial stem was nil" if  participial_stem.nil?
            endings = %w(ns ntis)
            endings.collect{ |x| fix_macrons(participial_stem + x.chomp) }.join(', ')
          end

          def future_active_participle
            mybase = passive_perfect_participle.gsub(/u[sm]$/, "ūr")
            singular_endings = %w(us a um)
            singular_endings.collect{ |x| mybase + "#{x}".chomp }.join(', ')
          end

          def perfect_passive_participle
            mybase = passive_perfect_participle.sub(/u[sm]$/,'')
            singular_endings=%w(us a um)
            singular_endings.collect{ |x| mybase + "#{x}".chomp }.join(', ')
          end

          def future_passive_participle
            mybase = participial_stem + "nd"
            singular_endings = %w(us a um)
            singular_endings.collect{ |x| fix_macrons(mybase + "#{x}".chomp) }.join(', ')
          end

          def gerundive
            @verb.future_passive_participle
          end

          def gerund
            b = gerundive.sub( /.*\s+(.*)um.*$/, "\\1" )
            b += "ī, ō, etc."
          end

          def supine
            acc = passive_perfect_participle
            abl = acc.sub( /^(.*)um$/, "\\1" )
            abl += "ū"
            {:ablative => abl, :accusative => acc}
          end
        end
      end
    end
  end
end
