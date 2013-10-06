# encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      module Deponent
        # In a bit of cleverness, if the verb is deponent, we have built out
        # this verb as if it were regular, but we have also created a
        # @proxyVerb which is the active 'pseudo verb' corresponding to this
        # verb.  We should be able to take this verb's active formulations
        # and set their results to the @proxyVerb's passive formulations
        #
        # Ergo:  miror/mirari/miratus =~
        # miro/mirare/PreventDeponentInfiniteRegress/miratus Therefore make a
        # LatinVerb.new(miro/mirare/PreventDeponentInfiniteRegress/miratus).
        # Take its passives and set them to this verb's actives.  This is
        # actually what students do heuristically in Latin classes.

        include Linguistics::Latin::Phonographia

        def self.extended(extending_instance)
          extending_instance.instance_eval do
            @proxy_verb_string = Linguistics::Latin::Verb::LatinVerb::DeponentStringDeriver.new(@original_string).proxy_string
            @proxyVerb         = Linguistics::Latin::Verb::LatinVerb.new @proxy_verb_string
            apply_deponent_masking
          end
        end
        ##
        #
        # Top-level method used to call the sub-methods which create a facade so that
        # active_ vectors can be called on a deponent which actually forwards that
        # call to a "fake" non-deponent (+@proxyVerb+) whose passives fit the correct
        # morphology
        #
        # It calls the following methods, each of which applies the masking to a
        # certain collection of vectors:
        #
        # * +deponent_swap+ :: active_voice* remaps "standard" calls like
        # +active_voice_indicative_mood_present_tense...+
        # * +deponent_imperative_mutations+ :: masks the imperatives
        # * +deponent_participle_mutations+ :: masks the participles
        # * +deponent_infinitive_mutations+ :: masks the infinitives
        #
        ##

        def apply_deponent_masking
          deponent_swap
          deponent_imperative_mutations
          deponent_participle_mutations
          deponent_infinitive_mutations
        end

        ##
        #
        # The deponent's imperatives require a bit of consideration.  They don't
        # follow the stem/stem+'ite' format.
        #
        ##

        def deponent_imperative_mutations # :nodoc:
          self.singleton_class.class_eval do
            def active_voice_imperative_mood_present_tense_second_person_singular_number
              return @proxyVerb.send(:present_active_infinitive)
            end
            def active_voice_imperative_mood_present_tense_second_person_plural_number
              return @proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
            end
            def active_voice_imperative_mood_future_tense_second_person_singular_number
              k=@proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
              k.sub!(/minī$/, '')
              k += 'tor'
              fix_macrons k
            end
          end
        end

        def deponent_participle_mutations # :nodoc:
          self.singleton_class.class_eval do
            def present_active_participle
              return @proxyVerb.present_active_participle
            end

            def future_active_participle
              return @proxyVerb.future_active_participle
            end

            def perfect_active_participle
              return @proxyVerb.perfect_passive_participle
            end

            def future_passive_participle
              return @proxyVerb.future_passive_participle
            end

            # Mask the supine
            def supine
              return @proxyVerb.supine
            end
          end
        end

        def deponent_infinitive_mutations # :nodoc:
          self.singleton_class.class_eval do
            def present_active_infinitive
              return @proxyVerb.send :present_passive_infinitive
            end
            def perfect_active_infinitive
              return @proxyVerb.send :perfect_passive_infinitive
            end
            def future_active_infinitive
              return @proxyVerb.send :future_active_infinitive
            end
          end
        end

        ##
        #
        # Swaps this verb's active_ vectors and replaces them with
        # @proxyVerb's passive_ vectors.  This is pretty darned sneaky. See
        # Also deponent_swap
        #
        ##

        def deponent_swap
          # First, get the methods that were defined in the proxy as passive

          storage = {}

          @proxyVerb.tense_list.grep(/^passive/).each do |pass|
            # Find the active correlate
            active_corr = pass.to_s.sub( /^passive(.*)/, "active\\1" )

            #  Keep @proxyVerb in the binding scope
            pV = @proxyVerb

            # In self, find the passive and save it's resultant object into a
            # hash for future use.
            self.singleton_class.class_eval do
              storage[active_corr.to_sym] = pV.send(pass)
            end
          end

          # Take the stored hashes and define instance methods on self such
          # that we intercept the mixed-in methods ( C-c-c-combo breaker! ).
          storage.each_pair do |k,v|
            self.singleton_class.class_eval do
              define_method k, lambda { return v }
            end
          end
        end
      end
    end
  end
end
