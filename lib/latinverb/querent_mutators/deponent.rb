require_relative './deponent/tense_block_mutator'

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
              @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
            end

            def mutate!
              TenseBlockMutator.new(@verb, @querent, @proxyVerb).mutate!
            end

            private

            def proxy_string
              DeponentStringDeriver.new(original_string).proxy_string
            end
          end
        end
      end
    end
  end
end
