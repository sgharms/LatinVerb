# encoding: UTF-8

# The purpose of this module is to contain the metaprogramming modules
# method_missing and respond_to? in a place that's nice and neat.

module Linguistics
  module Latin
    module Verb 
      class LatinVerb
        def method_missing(symbol, *args )
          super if @tense_list.nil?
          @tense_list.find do |e|
            if symbol.to_s.match /^(#{e})_(.*)/
              tense_method, vector_specifier = $1, $2
              # This is added to prevent stack-level too deep errors
              begin
                if self.respond_to?(tense_method.to_sym)
                  return send(tense_method.to_sym).send(vector_specifier.to_sym)
                end
              rescue SystemStackError => e
                STDERR.puts "We encountered a SystemStackError when calling #{tense_method}"
                STDERR.puts "WARNING:  Failed to resolve [#{tense_method}] with [#{vector_specifier}].  \n\nMake sure #{tense_method} is defined."
                super
              end
            end
          end
          super
        end

        def respond_to?(symbol, include_private=false)
          super if respondable_methods.empty?
          self.respondable_methods.grep(Regexp.new %Q/^#{symbol}$/).empty? ?
            super : true
        end
      end
    end
  end
end

