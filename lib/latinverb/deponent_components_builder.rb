module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class DeponentComponentsBuilder
          extend Forwardable
          def_delegators :@verb, :original_string, :passive_perfect_participle

          def initialize(verb)
            @verb = verb
            @proxyVerb = LatinVerb.new(DeponentStringDeriver.new(original_string).proxy_string)
          end

          def components
            [ infinitivizer, imperatives_handler, participler ]
          end

          def imperatives_handler # TODO:  not clean!
            imperatives = @proxyVerb.instance_variable_get(:@imperative_handler)
            proxyVerb = @proxyVerb
            imperatives.instance_eval do
              @proxyVerb = proxyVerb

              def imperatives
                t = TenseBlock.new(%w/foo bar bin bat bang bibble/)
                t.instance_eval do
                end
              end
            end
            imperatives
          end

          def infinitivizer
            proxyVerb = @proxyVerb
            infinitivizer = Infinitivizer.new(@verb)
            infinitivizer.instance_eval do
              @proxyVerb = proxyVerb

              def present_active_infinitive
                return @proxyVerb.send :present_passive_infinitive
              end

              def perfect_active_infinitive
                return @proxyVerb.send :perfect_passive_infinitive  #TODO:  Get rid of send!
              end

              def future_active_infinitive
                return @proxyVerb.send :future_active_infinitive
              end

              def present_passive_infinitive
                return NullTenseBlock.new
              end
            end
            infinitivizer
          end

          def participler
            proxyVerb = @proxyVerb
            participler = Participler.new(@verb)
            participler.instance_eval do
              @proxyVerb = proxyVerb
              def present_active_participle
                return @proxyVerb.present_active_participle
              end

              def future_active_participle
                return @proxyVerb.future_active_participle
              end

              def perfect_active_participle
                return @proxyVerb.perfect_passive_participle
              end

              def future_passive_participle
                return @proxyVerb.future_passive_participle
              end

              def supine
                return @proxyVerb.supine
              end
            end
            participler
          end
        end
      end
    end
  end
end
