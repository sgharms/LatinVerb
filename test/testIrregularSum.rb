#encoding:  UTF-8

require 'test/unit'
require 'json'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'latinverb/latinverb_classification_types'

# Internal dependencies

class TestIrregularSum < Test::Unit::TestCase
  def setup
    @toBe = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
  end
  def test_essential_irregular_qualities
    assert_equal(true, @toBe.irregular?)
    assert_nothing_raised "When making sure that you can get the basic lookup
    done" do
      @toBe.active_voice_indicative_mood_present_tense_first_person_singular_number
    end
    assert_equal('sum', @toBe.active_voice_indicative_mood_present_tense_first_person_singular_number)
    assert_equal('sim', @toBe.active_voice_subjunctive_mood_present_tense_first_person_singular_number)
  end
end
