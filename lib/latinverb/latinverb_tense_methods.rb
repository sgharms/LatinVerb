# encoding: UTF-8
module Linguistics 
  module Latin 
    module Verb 
      module TenseMethods
        class TenseBlock
          def initialize(r)
            @results = r
          end
          def first_person_singular_number;  return @results[0]; end
          def second_person_singular_number; return @results[1]; end
          def third_person_singular_number;  return @results[2]; end
          def first_person_plural_number;    return @results[3]; end
          def second_person_plural_number;   return @results[4]; end
          def third_person_plural_number;    return @results[5]; end
        end
        def active_voice_imperative_mood_present_tense
        end
        def active_voice_indicative_mood_future_tense
        end
        def active_voice_indicative_mood_futureperfect_tense
        end
        def active_voice_indicative_mood_imperfect_tense
        end
        def active_voice_indicative_mood_pastperfect_tense
        end
        def active_voice_indicative_mood_perfect_tense
        end
        def active_voice_indicative_mood_present_tense
          return TenseBlock.new(%w/foo bar bin bat bas boo/)
        end
        def active_voice_subjunctive_mood_imperfect_tense
        end
        def active_voice_subjunctive_mood_pastperfect_tense
        end
        def active_voice_subjunctive_mood_perfect_tense
        end
        def active_voice_subjunctive_mood_present_tense
        end
        def passive_voice_indicative_mood_future_tense
        end
        def passive_voice_indicative_mood_futureperfect_tense
        end
        def passive_voice_indicative_mood_imperfect_tense
        end
        def passive_voice_indicative_mood_pastperfect_tense
        end
        def passive_voice_indicative_mood_perfect_tense
        end
        def passive_voice_indicative_mood_present_tense
        end
        def passive_voice_subjunctive_mood_imperfect_tense
        end
        def passive_voice_subjunctive_mood_pastperfect_tense
        end
        def passive_voice_subjunctive_mood_perfect_tense
        end
        def passive_voice_subjunctive_mood_present_tense
        end
      end
    end
  end
end

