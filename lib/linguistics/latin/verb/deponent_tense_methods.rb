module Linguistics
  module Latin
    module Verb
      ##
      #
      # Applies mutations to the method calls for semi-deponents.
      # Reference A&G 192:
      #
      # "A few verbs having no perfect stem are regular in the present, but
      # appear in the tenses of completed action as deponents.  These are
      # called Semi-deponents."
      ##
      module DeponentTenseMethods
        # There's really no good reason that these should be re-defined here,
        # the methods that result from the verbector operation should be
        # sufficient.  The only snare is that if you look at the method call
        # in =tense_methods.rb=, your @classification is set to
        # =Semideponent=.  This means that the conditional lookup fails. So
        # the choices are to blanket overwrite here, or add another
        # conditional to each TenseBlock returning method, OR break the model
        # of TenseBlock construction.  I think the last is the best option,
        # but this current implementation is the second best.

        def active_voice_indicative_mood_present_tense
          return @proxyVerb.send :active_voice_indicative_mood_present_tense
        end

        def active_voice_indicative_mood_imperfect_tense
          return @proxyVerb.send :active_voice_indicative_mood_imperfect_tense
        end

        def active_voice_indicative_mood_future_tense
          return @proxyVerb.send :active_voice_indicative_mood_future_tense
        end

        # These methods handle the strangeness of semi-deponents, it masks
        # passive perfects to active perfects

        def active_voice_indicative_mood_perfect_tense
          return @proxyVerb.send :passive_voice_indicative_mood_perfect_tense
        end
        def active_voice_indicative_mood_pastperfect_tense
          return @proxyVerb.send :passive_voice_indicative_mood_pastperfect_tense
        end
        def active_voice_indicative_mood_futureperfect_tense
          return @proxyVerb.send :passive_voice_indicative_mood_futureperfect_tense
        end

        def passive_voice_indicative_mood_perfect_tense
          return NullTenseBlock.new
        end

        def passive_voice_indicative_mood_pastperfect_tense
          return NullTenseBlock.new
        end
        def passive_voice_indicative_mood_futureperfect_tense
          return NullTenseBlock.new
        end

        # Subjunctives: 2 active, 2 passive
        def active_voice_subjunctive_mood_present_tense
          return @proxyVerb.send :active_voice_subjunctive_mood_present_tense
        end

        def active_voice_subjunctive_mood_imperfect_tense
          return @proxyVerb.send :active_voice_subjunctive_mood_imperfect_tense
        end

        def active_voice_subjunctive_mood_perfect_tense
          return @proxyVerb.send :passive_voice_subjunctive_mood_perfect_tense
        end
        def active_voice_subjunctive_mood_pastperfect_tense
          return @proxyVerb.send :passive_voice_subjunctive_mood_pastperfect_tense
        end
        def passive_voice_subjunctive_mood_perfect_tense
          return NullTenseBlock.new
        end
        def passive_voice_subjunctive_mood_pastperfect_tense
          return NullTenseBlock.new
        end
      end
    end
  end
end

