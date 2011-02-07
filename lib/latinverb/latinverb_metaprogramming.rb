# encoding: UTF-8

# The purpose of this module is to contain the metaprogramming modules
# method_missing and respond_to? in a place that's nice and neat.

module Linguistics
  module Latin
    module Verb 
      class LatinVerb
        def method_missing(symbol, *args )
          @cluster_methods.find do |e|
            if symbol.to_s.match /^(#{e})(.*)/
              # This is added to prevent stack-level too deep errors
              begin
                if self.respond_to?($1.to_sym)
                  puts "We respond to #{$1}"
                  self.send($1.to_sym, $2)
                  return
                end
              rescue SystemStackError => e
                STDERR.puts "We encountered a SystemStackError when calling #{$1}"
                super
              ensure
                STDERR.puts "WARNING:  Failed to resolve [#{$1}] with [#{$2}].  \n\nMake sure #{$1} is defined."
              end
            end
          end
          super
        end

        def respond_to?(symbol, include_private=false)
          respondable_methods.grep(Regexp.new %Q/^#{symbol}$/).empty? ?
            super : true
        end
      end
    end
  end
end

