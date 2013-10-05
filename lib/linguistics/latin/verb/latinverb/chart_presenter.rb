class Linguistics::Latin::Verb::ChartPresenter
  def initialize(verb)
    @verb = verb
  end

  def chart
    f="%9s%15s%15s%15s\n"
    f_subjunctive="%9s%15s%15s%15s%15s\n"
    c_prep "Present System", [
                              @verb.active_voice_indicative_mood_present_tense,
                              @verb.active_voice_indicative_mood_imperfect_tense,
                              @verb.active_voice_indicative_mood_future_tense
                             ], %w/Present Imperfect Future/,f
    puts "\n"
    c_prep "Perfect System", [ @verb.active_voice_indicative_mood_perfect_tense,
                               @verb.active_voice_indicative_mood_pastperfect_tense,
                               @verb.active_voice_indicative_mood_futureperfect_tense
                             ], %w/Perfect Past-Perfect Future-Perfect/,f
    puts "\n"
    c_prep "Passive Present System", [
                                      @verb.passive_voice_indicative_mood_present_tense,
                                      @verb.passive_voice_indicative_mood_imperfect_tense,
                                      @verb.passive_voice_indicative_mood_future_tense
                                     ], %w/Present Imperfect Future/,f
    puts "\n"
    c_prep "Passive Perfect System", [ @verb.passive_voice_indicative_mood_perfect_tense,
                                       @verb.passive_voice_indicative_mood_pastperfect_tense,
                                       @verb.passive_voice_indicative_mood_futureperfect_tense
                                     ], %w/Perfect Past-Perfect Future-Perfect/,f
    puts "\n"


    c_prep "Subjunctives", [ @verb.active_voice_subjunctive_mood_present_tense,
                             @verb.active_voice_subjunctive_mood_imperfect_tense,
                             @verb.active_voice_subjunctive_mood_perfect_tense,
                             @verb.active_voice_subjunctive_mood_pastperfect_tense
                           ], %w/Present Imperfect Perfect Past-Perfect/,f_subjunctive
    puts "\n"
    c_prep "Passive Subjunctives", [ @verb.active_voice_subjunctive_mood_present_tense,
                                     @verb.active_voice_subjunctive_mood_imperfect_tense,
                                     @verb.active_voice_subjunctive_mood_perfect_tense,
                                     @verb.active_voice_subjunctive_mood_pastperfect_tense
                                   ], %w/Present Imperfect Perfect Past-Perfect/,f_subjunctive
    puts "\n"
    puts "Participles"
    @verb.methods.grep(/_participle$/).each do |p|
      printf "%42s %42s\n", p.to_s.gsub('_', ' ').gsub(/\b\w/){$&.upcase}, @verb.send(p)
    end
    puts "\n"
    puts "Infinitives"
    @verb.methods.grep(/infinitive$/).each do |p|
      printf "%42s %42s\n", (p.to_s.gsub('_', ' ').gsub(/\b\w/){$&.upcase}), @verb.send(p)
    end
    return nil
  end

  alias_method :c, :chart
  private

  def c_prep(heading, rays, subtitles, format_string)
    puts heading
    puts '=' * heading.length + "\n"
    printf format_string, '', *subtitles
    underbars = subtitles.map{|j| j.gsub!(  /./, '=' )}
    printf format_string, '', *underbars
    vertical_transform( rays ).each{|a| printf format_string, *a}
  end

  def vertical_transform( opts = [] )
    # Get the length of the first array to be verticalized
    ['1st Sg.', '2nd Sg.', '3rd Sg.','1st Pl.', '2nd Pl.', '3rd Pl.'].zip(*opts)
  end
end
