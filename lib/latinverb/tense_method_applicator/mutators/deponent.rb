require_relative './deponent/tense_block_mutator'
require_relative './deponent/imperative_mutator'
require_relative './deponent/participle_mutator'
require_relative './deponent/infinitive_mutator'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Deponent
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

            def initialize(verb, opts={})
              @verb = verb
              @querent = verb.querent
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(@verb.original_string).proxy_string)
              @mutators_classes = opts[:mutator_classes] ||
                [ TenseBlockMutator, ImperativeMutator, ParticipleMutator, InfinitiveMutator ]
            end

            def mutate!
              @mutators_classes.each{ |m| m.new(@verb, @proxyVerb) }
            end
          end
        end
      end
    end
  end
end
