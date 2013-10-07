module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class PerfectTenseRemover
          def initialize(verb_with_perfect_tenses)
            @verb = verb_with_perfect_tenses
          end

          def remove!
            tense_blocks_to_eclipse =
              @verb.methods.grep( /^(active|passive).*(_|past|future)perfect_/ )

            tense_blocks_to_eclipse.each do |s|
              @verb.singleton_class.class_eval do
                define_method s do
                  return NullTenseBlock.new
                end
              end
            end
          end
        end
      end
    end
  end
end
