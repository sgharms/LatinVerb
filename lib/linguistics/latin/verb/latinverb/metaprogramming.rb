# encoding: UTF-8

=begin rdoc
#--
# The purpose of this module is to contain the metaprogramming modules
# method_missing and respond_to? in a place that's nice and neat.
# ++
=end

module Linguistics
  module Latin
    module Verb 
      class LatinVerb

=begin rdoc

=== DESCRIPTION

Override of the method_missing method.  A lot of the magic of LatinVerb
happens here.  This method has deep interactoion with the Verbvector results
called as part of the LatinVerb.initialize call path.

=== INTERNALS

Given a symbol that is undefined, we look to +@tense_list+ first.  The typical
case would be a call on a 3/5ths vector identification.  Therefore if the call
is pure nonsense, the symbol will not be found on the first evaluation and go
to super.  Assuming that the symbol IS a partial vector call, it will match
through the iteration of the values in +@tense_list+.  Based on the match, two
Regexp values are derived:

* the first 3/5ths (enough to get a TenseBlock), called a +tense_method+
* the last 2/5ths  (enough to specify a value out of that TenseBlock), called a +vector_specifier+

Given those two names, the tense_method is called on the LatinVerb with +send+
and _that_ resultant value, a TenseBlock, undergoes a +send+ call to the
specifier, thus all 5/5 components of the fully-qualified vector can result in
unique match.

--
TODO:  It should be possible to ONLY pass the 3/5ths and get the collective result back
++

=end
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

        ##
        #
        # We override respond_to so that we respond to the normal object
        # models as well as accept the method_missing utilized names as well.
        # If it's in +respondable_methods+, we return true.
        #
        ##
        def respond_to?(symbol, include_private=false) 
          super if respondable_methods.empty?
          self.respondable_methods.grep(Regexp.new %Q/^#{symbol}$/).empty? ?
            super : true
        end
      end
    end
  end
end

