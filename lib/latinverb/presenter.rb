# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      module LatinVerbPresenter # :nodoc:
        def c_prep(heading, rays, subtitles, format_string)
          puts heading
          puts '=' * heading.length + "\n"
          printf format_string, '', *subtitles
          underbars = subtitles.map{|j| j.gsub!(  /./, '=' )}
          printf format_string, '', *underbars
          vertical_transform( rays ).each{|a| printf format_string, *a}
        end

        def chart
          f="%9s%15s%15s%15s\n"
          f_subjunctive="%9s%15s%15s%15s%15s\n"
          c_prep "Present System", [
                                    self.active_voice_indicative_mood_present_tense,
                                    self.active_voice_indicative_mood_imperfect_tense,
                                    self.active_voice_indicative_mood_future_tense
                                   ], %w/Present Imperfect Future/,f
          puts "\n"
          c_prep "Perfect System", [ self.active_voice_indicative_mood_perfect_tense,
                                     self.active_voice_indicative_mood_pastperfect_tense,
                                     self.active_voice_indicative_mood_futureperfect_tense
                                   ], %w/Perfect Past-Perfect Future-Perfect/,f
          puts "\n"
          c_prep "Passive Present System", [
                                            self.passive_voice_indicative_mood_present_tense,
                                            self.passive_voice_indicative_mood_imperfect_tense,
                                            self.passive_voice_indicative_mood_future_tense
                                           ], %w/Present Imperfect Future/,f
          puts "\n"
          c_prep "Passive Perfect System", [ self.passive_voice_indicative_mood_perfect_tense,
                                             self.passive_voice_indicative_mood_pastperfect_tense,
                                             self.passive_voice_indicative_mood_futureperfect_tense
                                           ], %w/Perfect Past-Perfect Future-Perfect/,f
          puts "\n"


          c_prep "Subjunctives", [ self.active_voice_subjunctive_mood_present_tense,
                                   self.active_voice_subjunctive_mood_imperfect_tense,
                                   self.active_voice_subjunctive_mood_perfect_tense,
                                   self.active_voice_subjunctive_mood_pastperfect_tense
                                 ], %w/Present Imperfect Perfect Past-Perfect/,f_subjunctive
          puts "\n"
          c_prep "Passive Subjunctives", [ self.active_voice_subjunctive_mood_present_tense,
                                           self.active_voice_subjunctive_mood_imperfect_tense,
                                           self.active_voice_subjunctive_mood_perfect_tense,
                                           self.active_voice_subjunctive_mood_pastperfect_tense
                                         ], %w/Present Imperfect Perfect Past-Perfect/,f_subjunctive
          puts "\n"
          puts "Participles"
          self.methods.grep(/_participle$/).each do |p|
            printf "%42s %42s\n", p.to_s.gsub('_', ' ').gsub(/\b\w/){$&.upcase}, self.send(p)
          end
          puts "\n"
          puts "Infinitives"
          self.methods.grep(/infinitive$/).each do |p|
            printf "%42s %42s\n", (p.to_s.gsub('_', ' ').gsub(/\b\w/){$&.upcase}), self.send(p)
          end
          return nil
        end

        alias_method :c, :chart

        def labels
          ['1st Sg.', '2nd Sg.', '3rd Sg.','1st Pl.', '2nd Pl.', '3rd Pl.']
        end

        def vertical_transform( opts = [] )
          # Get the length of the first array to be verticalized
          labels.zip(*opts)
        end
      end
    end
  end
end
