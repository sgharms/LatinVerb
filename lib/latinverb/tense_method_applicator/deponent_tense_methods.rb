module Linguistics
  module Latin
    module Verb
      ##
      #
      # Applies mutations to the method calls for semi-deponents.
      # Reference A&G 192:
      #
      # "A few verbs having no perfect stem are regular in the present, but
      # appear in the tenses of completed action as deponents.  These are
      # called Semi-deponents."
      ##
      module DeponentTenseMethods
        # There's really no good reason that these should be re-defined here,
        # the methods that result from the verbector operation should be
        # sufficient.  The only snare is that if you look at the method call
        # in =tense_methods.rb=, your @classification is set to
        # =Semideponent=.  This means that the conditional lookup fails. So
        # the choices are to blanket overwrite here, or add another
        # conditional to each TenseBlock returning method, OR break the model
        # of TenseBlock construction.  I think the last is the best option,
        # but this current implementation is the second best.

      end
    end
  end
end

