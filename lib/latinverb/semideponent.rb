# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      module Semideponent
        def self.extended(extending_instance)
          extending_instance.instance_eval do
            @proxy_verb_string = Linguistics::Latin::Verb::LatinVerb.create_pseudo_active_mask_for_deponent @original_string
            @proxyVerb = Linguistics::Latin::Verb::LatinVerb.new @proxy_verb_string
            apply_semi_deponent_masking
          end
        end
        # Previously @deponent and @semideponent followed the same paths,
        # but in semideponents, the "present system" is handled as normal
        # (completed by _add_vector_methods, supra).  We need only mask, as
        # A&G #192 says: "the completed methods" i.e. the perfect system.
        def apply_semi_deponent_masking
          self.singleton_class.class_eval do
            include Linguistics::Latin::Verb::DeponentTenseMethods
          end
        end
      end
    end
  end
end

