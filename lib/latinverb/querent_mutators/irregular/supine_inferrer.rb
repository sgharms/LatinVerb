module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module QuerentMutators
          class Irregular
            class SupineInferrer
              def initialize(perfect_passive_participle)
                @perfect_passive_participle = String(perfect_passive_participle)
              end

              def supine
                return {} unless accusative_supine
                {:ablative => ablative_supine, :accusative => accusative_supine}
              end

              private

                def ablative_supine
                  return @ablative_supine if @ablative_supine
                  return "" if ablative_supine_base.nil?
                  String(ablative_supine_base + "ū")
                end

                def ablative_supine_base
                  return nil if accusative_supine.nil?
                  String(accusative_supine.sub(/^(.*)u(m)$/, "\\1"))
                end

                def accusative_supine
                  split_participle_string = @perfect_passive_participle.split(/\s+/).first
                  return nil if  split_participle_string.nil?
                  @accusative_supine ||= String(split_participle_string.sub(/s\z/,'m'))
                end
            end
          end
        end
      end
    end
  end
end

