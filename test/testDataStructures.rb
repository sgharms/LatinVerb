# encoding: UTF-8

require "test/unit"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'

# Internal dependencies

class TestDataStructures < Test::Unit::TestCase
  def setup
    @aFirstDS = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end
  def test_to_hash
    h = @aFirstDS.to_hash
    assert_equal(21, h.keys.length )
    assert_equal("amem", h[:active_voice_subjunctive_mood_present_tense][0])
    assert_equal("amant",
    h[:active_voice_indicative_mood_present_tense].third_person_plural_number)
  end
  def test_yaml
    assert_nothing_raised do
      @aFirstDS.to_y
    end
    assert_nothing_raised { 
    @aFirstDS.active_voice_indicative_mood_perfect_tense.to_a.to_yaml }
    @aFirstDS.active_voice_indicative_mood_perfect_tense
  end
  def test_json
    assert_nothing_raised {
      @aFirstDS.pretty_generate }
  end
end
