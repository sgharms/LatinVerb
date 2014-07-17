# encoding: UTF-8

class ImperfectBlockTest < Minitest::Test # :nodoc:
  def setup
    @aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end

  def test_basic
    assert @aFirst.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert "amāte", @aFirst.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_present_tense_second_person_singular_number

    assert "amāte", @aFirst.active_voice_imperative_mood_future_tense_second_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_future_tense_second_person_singular_number

    assert "amāte", @aFirst.active_voice_imperative_mood_future_tense_third_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_future_tense_third_person_singular_number
  end
end
