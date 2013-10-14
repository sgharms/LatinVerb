module Linguistics
  module Latin
    module Verb
      class LatinVerb
        module Mutators
          class Invariant
            ##
            #
            # === GRAMMATICAL FUNCTION
            #
            # Used to express command.  As A&G notes, oftentimes the Subjunctive
            # is the correct mood for exhortation.
            #
            ###
            class ImperativesStrategy
              IMPERATIVE_EXCEPTIONS = {
                "ducere"   => %w(duc ducite),
                "dicere"   => %w(dic dicite),
                "facere"   => %w(fac facite),
                "ferre"    => %w(fer ferte),
                "nolere"   => %w(nolo nolite)
              }
              
              def initialize(verb)
                @verb = verb
              end

              def apply!
                byebug
                args = exceptional_imperative? ? calculate_exceptional_imperatives : [@verb.stem, @verb.present_active_infinitive]
                @verb.instance_eval do
                  def imperatives
                    Linguistics::Latin::Verb::ImperativeBlock.new(*args, self)
                  end
                end
              end


              private

              def exceptional_imperative?
                IMPERATIVE_EXCEPTIONS.has_key?(present_active_infinitive)
              end

              def calculate_exceptional_imperatives
                IMPERATIVE_EXCEPTIONS[present_active_infinitive]
              end
            end
          end
        end
      end
    end
  end
end
