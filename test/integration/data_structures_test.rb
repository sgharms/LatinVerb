# encoding: UTF-8

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'

# Internal dependencies

class DataStructuresTest < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aFirstDS = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end

  def test_to_hash
    h = @aFirstDS.to_hash
    assert_equal(23, h.keys.length )
    assert_equal("amem", h[:active_voice_subjunctive_mood_present_tense][0])
    assert_equal("amant",
    h[:active_voice_indicative_mood_present_tense].third_person_plural_number)
  end

  def test_yaml
    assert @aFirstDS.to_y, "to_y should return a yaml structure"
    assert @aFirstDS.active_voice_indicative_mood_perfect_tense.to_a.to_yaml, "to_yaml should return a yaml structure"
    assert @aFirstDS.active_voice_indicative_mood_perfect_tense, "A tense block should be returned"
  end

  def test_json
    assert @aFirstDS.pretty_generate
  end
end
