# encoding: UTF-8

require "test/unit"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'

# Internal dependencies

class TestDataStructures < Test::Unit::TestCase
  def setup
    @aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end
  def test_to_hash
    @aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
    h = @aFirst.to_hash
    assert_equal(21, h.keys.length )
    assert_equal("amem", h[:active_voice_subjunctive_mood_present_tense][0])
    assert_equal("amant",
    h[:active_voice_indicative_mood_present_tense].third_person_plural_number)
  end
  def test_yaml
    assert_nothing_raised do
      @aFirst.to_y
    end
    assert_nothing_raised { 
    @aFirst.active_voice_indicative_mood_perfect_tense.to_a.to_yaml }
    @aFirst.active_voice_indicative_mood_perfect_tense
  end
  def test_json
  puts @aFirst.to_json.empty?
  puts @aFirst.to_json.nil?
  puts @aFirst.to_json.class
pp @aFirst.to_json
    assert_true (not @aFirst.to_json.empty?)
  end
end
