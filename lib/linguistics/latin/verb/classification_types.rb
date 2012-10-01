# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
=begin rdoc

  == NAME

  VerbTypes

  == DESCRIPTION

  A VerbType is a parent, _conceptually abstract_  class for tracking
  classifications of verbs.  At the present time it is an empty class.  It is
  foreseeable, however, that in the future, it may be advantagous to associate
  specific behaviors to it.  It is subclassed into the various types of Verbs
  identified in Latin pedagogy:  First, Second, Third, ThirdIO, Fourth,
  Irregular, and Deponent.  These classes, effectively, behave as strings as
  attributes to the classification attribute within a LatinVerb.

  VerbTypes, therefore, is the module containing these VerbTypes.

=end

      module Classification
        class ClassificationType; end
        class Semideponent < ClassificationType; end
        class Deponent < ClassificationType; end
        class Irregular < ClassificationType; end
        class Impersonal < ClassificationType; end
        class Defective < ClassificationType; end
        class Regular < ClassificationType; end
        class PresentOnly < ClassificationType; end

      end
      module VerbTypes
        ##
        #--
        # == DESCRIPTION
        #
        # Abstract ancestor class that defines the various subclass Verb Types
        # ++
        #
        ##
        class VerbType  # :nodoc:
        end
        class First     < VerbType # :nodoc:
        end
        class Second    < VerbType # :nodoc:
        end
        class Third     < VerbType # :nodoc:
        end
        class ThirdIO   < VerbType # :nodoc:
        end
        class Fourth    < VerbType # :nodoc:
        end
      end
    end
  end
end

