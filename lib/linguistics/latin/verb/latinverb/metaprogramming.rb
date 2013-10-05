module Linguistics
  module Latin
    module Verb
      class LatinVerb
=begin rdoc
#--
# The purpose of this module is to contain the metaprogramming modules
# method_missing and respond_to? in a place that's nice and neat.
# ++
=end


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

=end
        def method_missing(method_name, *args )  # :nodoc:
          method_name_components = method_name.to_s.split('_')

          tense_method = Array(method_name_components[0..5]).join('_')
          vector_specifier = Array(method_name_components[6..-1]).join('_')

          raise RuntimeError, "Lookup on #{method_name} failed" if tense_method.nil? || vector_specifier.nil?

          if self.respond_to?(tense_method.to_sym)
            tense_block = send(tense_method.to_sym)
            raise RuntimeError, "Call for #{tense_method} failed" if tense_block.nil?
            tense_block.send(vector_specifier.to_sym)
          else
            super
          end
        end

        ##
        #
        # We override respond_to so that we respond to the normal object
        # models as well as accept the method_missing utilized names as well.
        # If it's in +respondable_methods+, we return true.
        #
        ##
        def respond_to_missing?(method_name, include_private = false) #:nodoc:
          components     = method_name.to_s.split('_')
          tense_method   = components[0..5].join('_').to_sym

          return false unless @tense_list.nil? || @tense_list.include?( tense_method.to_s )

          if components.length > 6
            tb           = self.send(tense_method)
            vector_call  = components[6..-1].join('_').to_sym
            tb.send(vector_call)
          end
          true

        end
      end
    end
  end
end

