# encoding: UTF-8
# vim:  set fdm=marker tw=80 sw=2 wrap:

module Linguistics
  module Latin
    module Verb
      module TenseDefinitions
        module Irregular
          def self.included(inclusor)
            begin
              os_sym = self.symbolize_original_string @original_string
              json_string = Linguistics::Latin::Verb.const_get os_sym

              raise "Found a JSON string with null length!" if json_string.length <= 10
              revivified_data_structure = JSON.load(json_string)
            rescue JSON::ParserError => e
              puts "We were unable to parse JSON for #{@original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please verify your syntax."
              raise e
            rescue NameError => e
              puts "We were unable to find a definition for #{@original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please provide one."
              raise e
            rescue => error
              warn "#{@original_string} was identified as irregular but did not have a definition provided."
              raise error
            end

            revivified_data_structure['tense_blocks'].each_pair do |k,v|
              singleton_class.class_eval do
                define_method k.to_sym do
                  TenseBlock.new v, { :meaning => MEANINGS[k.to_sym] }
                end
              end
            end

            @irregular_infinitives = revivified_data_structure['infinitives']
            @irregular_participles = revivified_data_structure['participles']

            return if @irregular_infinitives.nil?
            return if @irregular_participles.nil?

            singleton_class.class_eval do
              def present_active_infinitive; return @irregular_infinitives.present_active_infinitive; end
              def present_passive_infinitive; return @irregular_infinitives.present_passive_infinitive; end
              def perfect_active_infinitive; return @irregular_infinitives.perfect_active_infinitive; end
              def perfect_passive_infinitive; return @irregular_infinitives.perfect_passive_infinitive; end
              def future_passive_infinitive; return @irregular_infinitives.future_passive_infinitive; end
              def future_active_infinitive; return @irregular_infinitives.future_active_infinitive; end
            end
            singleton_class.class_eval do
              def present_active_participle; return @irregular_participles.present_active_participle; end
              def future_active_participle; return @irregular_participles.future_active_participle; end
              def perfect_passive_participle; return @irregular_participles.perfect_passive_participle; end
              def future_passive_participle; return @irregular_participles.future_passive_participle; end
              def gerundive; return @irregular_participles.gerundive; end
              def gerund; return @irregular_participles.d; end
            end
          end

          def self.symbolize_original_string
            # Translation added to account for Ruby not liking constants /^/
            # with a multibyte.  Probably a bug.
            #
            # This bug can be discovered by running #constants on
            # Linguistics::Latin::Verb and seeing that Ōxxx is not found.  To
            # fix this i had to store it as ODI_.  To make /that/ hack work, I
            # had to add this bit beginning two lines below :-/
            o = ActiveSupport::Multibyte::Chars.new( @original_string.gsub(/\s+/,'_') ).upcase

            if o.match(/^([ĀĒĪŌŪ])(.*)/)
              x=o[0,1].tr 'ĀĒĪŌŪ', 'AEIOU'
              y=o[1,o.length]
              o= x+y
            end

            o.to_sym
          end
        end
      end
    end
  end
end

