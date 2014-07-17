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
            extend Forwardable
            def_delegators :@verb, :original_string

            def initialize(verb, querent, opts={})
              @verb = verb
              @querent = querent
              @proxyVerb = LatinVerb.new(proxy_string)
              @mutators_classes = opts[:mutator_classes] || default_mutators
            end

            def mutate!
              @mutators_classes.each{ |m| m.new(@verb, @querent, @proxyVerb) }
            end

            private

            def default_mutators
              [ TenseBlockMutator, ParticipleMutator, InfinitiveMutator ]
            end

            def proxy_string
              DeponentStringDeriver.new(original_string).proxy_string
            end
          end
        end
      end
    end
  end
end
