module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            class IrregularBuilder
              extend Forwardable
              def_delegators :@verb, :original_string, :classified_as

              def initialize(verb)
                @verb = verb
              end

              def build!
                if classified_as.impersonal?
                  impersonal_builder
                else
                  irregular_from_stored_definition
                end
              end

              private

              def impersonal_builder
                @verb.instance_eval do
                  def active_voice_indicative_mood_present_tense
                    TenseBlock.new ["", "", @original_string,
                      "", "", ""]
                  end

                  def active_voice_indicative_mood_present_tense_third_person_singular_number
                    return active_voice_indicative_mood_present_tense[2]
                  end
                end
              end

              def irregular_from_stored_definition
                validate(serialized_verb = find_serialized_irregular_verb)
                revivify!(serialized_verb)

                rescue => error
                  warn "#{original_string} was identified as irregular but did not have a definition provided."
                  raise error
              end

              def find_serialized_irregular_verb
                Linguistics::Latin::Verb.const_get(serialized_irregular_verb_lookup_key)
                rescue NameError => e
                  puts "Unable to find a definition for #{original_string}.  Please provide one."
                  raise e
              end


              def validate(serialized_verb)
                raise "Found a JSON string with null length!" if serialized_verb.length <= 10
              end

              def revivify!(serialized_verb)
                revivified_data_structure = JSON.load(serialized_verb)
                revivified_data_structure['tense_blocks'].each_pair do |k,v|
                  singleton_class.class_eval do
                    define_method k.to_sym do
                      TenseBlock.new v, { :meaning => MEANINGS[k.to_sym] }
                    end
                  end
                end

                @verb.instance_eval do
                  irregular_infinitives = revivified_data_structure['infinitives']
                  irregular_participles = revivified_data_structure['participles']
                end

                return if @irregular_infinitives.nil?
                return if @irregular_participles.nil?

                @verb.instance_eval do
                  def present_active_infinitive; return @irregular_infinitives.present_active_infinitive; end
                  def present_passive_infinitive; return @irregular_infinitives.present_passive_infinitive; end
                  def perfect_active_infinitive; return @irregular_infinitives.perfect_active_infinitive; end
                  def perfect_passive_infinitive; return @irregular_infinitives.perfect_passive_infinitive; end
                  def future_passive_infinitive; return @irregular_infinitives.future_passive_infinitive; end
                  def future_active_infinitive; return @irregular_infinitives.future_active_infinitive; end
                end

                @verb.instance_eval do
                  def present_active_participle; return @irregular_participles.present_active_participle; end
                  def future_active_participle; return @irregular_participles.future_active_participle; end
                  def perfect_passive_participle; return @irregular_participles.perfect_passive_participle; end
                  def future_passive_participle; return @irregular_participles.future_passive_participle; end
                  def gerundive; return @irregular_participles.gerundive; end
                  def gerund; return @irregular_participles.d; end
                end

                rescue JSON::ParserError => e
                  puts "Unable to parse JSON for #{original_string} [o:#{o}] [o_sym:#{o_upcase_and_symbolic}].  Please verify your syntax."
                  raise e
              end

              def serialized_irregular_verb_lookup_key
                o = ActiveSupport::Multibyte::Chars.new( original_string.gsub(/\s+/,'_') ).upcase

                if o.match(/^([ĀĒĪŌŪ])(.*)/)
                  x = o[0,1].tr 'ĀĒĪŌŪ', 'AEIOU'
                  y = o[1,o.length]
                  o = x + y
                end

                o.to_sym
              end
            end
          end
        end
      end
    end
  end
end
