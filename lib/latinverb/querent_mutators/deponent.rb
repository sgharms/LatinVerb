require_relative './deponent/tense_block_mutator'
require_relative './deponent/imperative_mutator'
require_relative './deponent/participle_mutator'
require_relative './deponent/infinitive_mutator'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Deponent
          include Linguistics::Latin::Phonographia

            def initialize(verb, opts={})
              @verb = verb
              @querent = verb.querent
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(@verb.original_string).proxy_string)
              @mutators_classes = opts[:mutator_classes] ||
                [ TenseBlockMutator, ParticipleMutator, InfinitiveMutator ]
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
