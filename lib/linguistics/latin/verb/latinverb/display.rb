# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb

        ##
        #
        # <b>You should not be using this, probably</b>
        #
        # This is a a convenience method so that you can print out the
        # contents in a human-readable fashion.  LatinVerb is a library that
        # _should be implemented elsewhere_ where its results can be presented
        # by more view-oriented libraries or applications.
        ##
        def display
          STDERR.puts "You should not be going much displaying here as this is a LIBRARY.  Implement this elsewhere."
          pretty_generate
        end
      end
    end
  end
end
