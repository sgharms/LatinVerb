module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class VectorApplicator
          attr_reader :latin_verbvector_generator

          def initialize(verb)
            @verb = verb
            construct_verb_vector_generator
            apply_extension_module!
            generate_tense_list
            verify_generated_tense_list!
          end

          private

          def construct_verb_vector_generator
            @latin_verbvector_generator =
              Linguistics::Verbs::Verbvector::VerbvectorGenerator.new(
                &Linguistics::Latin::Verb::LatinVerb::LATIN_VERBVECTOR_DESCRIPTION )
          end

          def apply_extension_module!
            @verb.extend @latin_verbvector_generator.method_extension_module
          end

          def generate_tense_list
            @verb.tense_list = @latin_verbvector_generator.cluster_methods[:tense_list].call
          end

         def verify_generated_tense_list!
           @verb.tense_list.each do |m|
             raise "FAILURE:  Critical method #{m} was not defined." unless (@verb.respond_to? m.to_sym)
           end
         end
        end
      end
    end
  end
end
