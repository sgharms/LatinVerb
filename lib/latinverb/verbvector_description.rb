module Linguistics
  module Latin
    module Verb
      class LatinVerb
        LATIN_VERBVECTOR_DESCRIPTION = Proc.new do
          language :Latin do
            all_vectors :start_with do
               {
                :voice =>  %w(active passive),
                :mood  =>  %w(indicative subjunctive imperative)
               }
            end
            vectors_that(/.*_indicative_mood/) do
              {
                :tense  => %w(present imperfect future
                              perfect pastperfect futureperfect)
              }
            end
            vectors_that(/.*_subjunctive_mood/) do
              {
                :tense => %w(present imperfect
                              perfect pastperfect)
              }
            end
            vectors_that(/.*_imperative_mood/) do
              {
                :tense => %w(present future)
              }
            end
            all_vectors :end_with do
              {
                :person => %w(first second third),
                :number => %w(singular plural)
              }
            end
            exception :remove, :passive_voice_imperative_mood_present_tense
            exception :remove, :passive_voice_imperative_mood_future_tense
            cluster_on :tense, "as method", :tense_list
          end
        end
      end
    end
  end
end

