module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Deponent
            class ImperativeMutator
              def initialize(verb, proxyVerb)
                @verb =verb
                @proxyVerb = proxyVerb
                mutate!
              end

              ##
              #
              # The deponent's imperatives require a bit of consideration.  They don't
              # follow the stem/stem+'ite' format.
              #
              ##

              def mutate!
                proxyVerb = @proxyVerb
                @verb.instance_eval do
                  extend Linguistics::Latin::Phonographia
                  @proxyVerb = proxyVerb

                  def active_voice_imperative_mood_present_tense_second_person_singular_number
                    @proxyVerb.send(:present_active_infinitive)
                  end

                  def active_voice_imperative_mood_present_tense_second_person_plural_number
                    return @proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
                  end
                  def active_voice_imperative_mood_future_tense_second_person_singular_number
                    k = @proxyVerb.send :passive_voice_indicative_mood_present_tense_second_person_plural_number
                    k.sub!(/minī$/, '')
                    k += 'tor'
                    fix_macrons k
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
