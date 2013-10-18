module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class TenseMethodApplicator
          class MutatorForVerbType
            def initialize(verb)
              @verb = verb
            end

            def mutate!
              mixin_module = constantize(derive_extending_module_name)
              @verb.extend mixin_module
            end

            private

            def constantize(s)
              s.split('::').inject(Object) do |mod, class_name|
                mod.const_get(class_name)
              end
            end

            def derive_extending_module_name
              mod_path = @verb.verb_type.to_s
              raise "#{@verb.inspect} did not find provide a verb type" unless mod_path
              mod_path.sub!('VerbTypes', 'TenseDefinitions' )
            end
          end
        end
      end
    end
  end
end
