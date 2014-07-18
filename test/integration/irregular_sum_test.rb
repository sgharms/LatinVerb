#encoding:  UTF-8

class IrregularSumTest < Minitest::Test # :nodoc:
  def setup
    @toBe = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
  end
  def test_essential_irregular_qualities
    assert_equal(true, @toBe.irregular?)
    assert @toBe.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal('sum', @toBe.active_voice_indicative_mood_present_tense_first_person_singular_number)
    assert_equal('sim', @toBe.active_voice_subjunctive_mood_present_tense_first_person_singular_number)
  end
end
