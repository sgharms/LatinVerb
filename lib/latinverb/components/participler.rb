module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class Participler
          include Linguistics::Latin::Phonographia

          def initialize(verb)
            @verb = verb
            @passive_perfect_participle = @verb.passive_perfect_participle
            @participial_stem = @verb.participial_stem
          end

          def present_active_participle
            raise "Participial stem was nil" if  @participial_stem.nil?
            endings = %w(ns ntis)
            endings.collect{ |x| fix_macrons(@participial_stem + x.chomp) }.join(', ')
          end

          def future_active_participle
            mybase = @passive_perfect_participle.gsub(/u[sm]$/, "ūr")
            singular_endings = %w(us a um)
            singular_endings.collect{ |x| mybase + "#{x}".chomp }.join(', ')
          end

          def perfect_passive_participle
            mybase = @passive_perfect_participle.sub(/u[sm]$/,'')
            singular_endings=%w(us a um)
            singular_endings.collect{ |x| mybase + "#{x}".chomp }.join(', ')
          end

          def future_passive_participle
            mybase = @participial_stem + "nd"
            singular_endings = %w(us a um)
            singular_endings.collect{ |x| fix_macrons(mybase+"#{x}".chomp) }.join(', ')
          end

          def gerundive
            @verb.future_passive_participle
          end

          def gerund
            b = gerundive.sub( /.*\s+(.*)um.*$/, "\\1" )
            b += "ī, ō, etc."
          end
        end
      end
    end
  end
end
