module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class SemideponentQuerentAdapter
          include Querent::QuerentInterface
          TENSE_METHOD_DEFINITIONS = [
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPresentTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodImperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPerfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodFutureTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodPastperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceIndicativeMoodFutureperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodImperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPerfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPastperfectTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodPresentTenseMethods,
            SemideponentQuerentAdapter::ActiveVoiceSubjunctiveMoodImperfectTenseMethods
          ]

          extend Forwardable
          def_delegators :@verb, :original_string

          def initialize(verb, wrapped_querent)
            @verb = verb
            @wrapped_querent = wrapped_querent
            @proxyVerb = LatinVerb.new(proxy_string, :proxy_verb => true)
            @added_vectorized_methods = []

            add_tense_methods!
            hide_unused_passive_tenses!
          end

          def add_tense_methods!
            collection = TENSE_METHOD_DEFINITIONS + tense_definitions_template
            extend_with_tense_method_definitions!(collection)
            register_methods!(collection)
          end

          private

          def hide_unused_passive_tenses!
            self.extend(NullifiedPassiveVoiceTenseBlocks)
          end

          def proxy_string
            DeponentStringDeriver.new(original_string).proxy_string
          end
        end
      end
    end
  end
end
