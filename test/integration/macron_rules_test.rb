# encoding: UTF-8

class MacronRulesTest < Minitest::Test # :nodoc:
  def test_basic
    aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'

    assert_equal "amō",        aFirst.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "amās",       aFirst.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "amat",       aFirst.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "amant",      aFirst.active_voice_indicative_mood_present_tense_third_person_plural_number
  end
end
