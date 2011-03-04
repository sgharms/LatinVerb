require 'json'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        def self.json_create(o)
          new( o )
        end
        def to_hash
          @tense_list.each do |t|
            ts = t.to_sym
            @data_structure[ts]=self.send ts
          end
          return @data_structure
        end
        alias_method :to_h, :to_hash
        def to_yaml
          @data_structure.empty? ?
            to_hash.to_yaml:
            @data_structure.to_yaml
        end
        alias_method :to_y, :to_yaml
        def to_json(*a)
          json_hash = {'json_class' => self.class.name}
          
          # In the case that we're working with a regular verb, the only thing
          # we need to save is the original string, since everything can be
          # re-derived from it easily.
          unless self.irregular?
            # While this single string is sufficient to freeze and revivifty
            # the verb, it means that the JSON structure is rather vacuous.
            # Given this, the hash is enriched so that the JSON data is
            # useful.  Nevertheless, in the revivification process, only
            # 'orig_string' is used.
            %w{original_string classification stem}.each do |k|
              json_hash[k] = self.send k.to_sym
            end
            # json_hash['original_string']  = original_string
            # json_hash['classification'] = classification
            # json_hash['stem'] = stem
            json_hash['tense_list' ]  = {}
            @tense_list.each do |t|
              json_hash['tense_list'][t.to_s] = self.send t.to_sym 
            end
            json_hash['irregular']    = irregular?
            return json_hash.to_json(*a)
          end

          {
            'json_class' => self.class.name,
            'revivify'    => 
              { 
                # tense_blocks => JSON string
                :tense_blocks =>
                                (@data_structure.empty? ?
                                  to_hash:
                                  @data_structure).to_json,
                :orig_string  => @original_string.to_json,

              }
           }.to_json(*a)
        end

        def pretty_generate
          JSON.pretty_generate(@data_structure.keys.length < 1 ? to_hash : @data_structure)
        end

        def _process_reviv_hash(h)
          puts h.class 
          h.keys.each{|x| puts "#{x.class}-#{x}=>#{h[x].class}"}
         
          JSON.parse(h['tense_blocks']).each_pair do |k,v|
            puts "preparing #{k.to_sym} and #{self.class}"
            self.class.instance_eval do
              define_method k.to_sym do
                return v
              end
            end
          end

          instance_variable_set :@original_string, h['orig_string']
          _derive_parts_from_given_string @original_string

            # Derive iVar from derived variables
            @participial_stem ||= calculate_participial_stem

            # Get all the methods that a LatinVerb must be able to respond to
            @latin_verbvector_generator = 
            Linguistics::Verbs::Verbvector::VerbvectorGenerator.new do
               language :Latin do
                 all_vectors :start_with do
                    {
                     :voice =>  %w(active passive),
                     :mood  =>  %w(indicative subjunctive imperative)
                    }
                 end
                 vectors_that /.*_indicative_mood/ do
                   {
                     :tense  => %w(present imperfect future
                                   perfect pastperfect futureperfect)
                   }
                 end
                 vectors_that /.*_subjunctive_mood/ do
                   {
                     :tense => %w(present imperfect 
                                   perfect pastperfect)
                   }
                 end
                 vectors_that /.*_imperative_mood/ do
                   {
                     :tense => %w(present)
                   }
                 end
                 all_vectors :end_with do
                   {
                     :number => %w(singular plural),
                     :person => %w(first second third)
                   }
                 end
                 exception :remove, :passive_voice_imperative_mood_present_tense
                 cluster_on :tense, "as method", :tense_list
               end
             end

          # This provides methods of the form #{language_name}_#{fake_name}.
          # They are actually called sans #{language_name} so that
          # method_missing is called.
          @verb_methods = @latin_verbvector_generator.method_extension_module

          # Make sure all the cluster methods are defined.  Ensure we don't
          # get infinite stack method_missing lookups
          @tense_list = 
            @latin_verbvector_generator.cluster_methods[:tense_list].call

          # POWER-UP with the vector methods
          self.extend @verb_methods

          # Given the use of method_missing to handle resolution, it's wise to
          # make sure that every cluster method /is/ actually defined.
          @tense_list.each do |m|
            raise "FAILURE:  Critical method #{m} was not defined." unless 
              (self.respond_to? m.to_sym)
          end

          # Placeholder the data structure that holds all the answers (a hash
          # of TenseBlocks).  This may be the typical case, but the
          # calculation is an expensive operation compared to the simple
          # vector query, so this won't actually get defined unless #to_hash
          # is called (cf. latinverb/display).
          @data_structure = {}
        end
      end
    end
  end
end
