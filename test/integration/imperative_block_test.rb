# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'

# Internal dependencies

class ImperfectBlockTest < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end

  def test_basic
    require 'pp'
    assert @aFirst.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert "amāte", @aFirst.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_present_tense_second_person_singular_number

    assert "amāte", @aFirst.active_voice_imperative_mood_future_tense_second_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_future_tense_second_person_singular_number

    assert "amāte", @aFirst.active_voice_imperative_mood_future_tense_third_person_plural_number
    assert "amā", @aFirst.active_voice_imperative_mood_future_tense_third_person_singular_number
  end
end
