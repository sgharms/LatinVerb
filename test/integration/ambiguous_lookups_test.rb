# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class AmbiguousLookupsTest < MiniTest::Unit::TestCase # :nodoc:
  def setup
     @aFourth = Linguistics::Latin::Verb::LatinVerb.new 'audiō audīre audīvī auditum'
  end

  def test_ambiguous_lookups_number_undef
    assert_equal @aFourth.active_voice_indicative_mood_present_tense_first_person_singular_number, 'audiō'
    assert_equal @aFourth.active_voice_indicative_mood_present_tense_first_person_plural_number, 'audimus'
    assert_equal @aFourth.active_voice_indicative_mood_present_tense_first_person.to_s, '["audiō", "audimus"]'
    assert_equal @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_third_person.to_s, '["[ auditus, audita, auditum ] esset", "[ auditī, auditae, audita ] essent"]'
  end

  def test_ambiguous_lookups_person_undef
    assert_equal @aFourth.active_voice_indicative_mood_present_tense_singular_number.to_s, '["audiō", "audis", "audit"]'
    assert_equal @aFourth.active_voice_indicative_mood_imperfect_tense_plural_number.to_s, '["audiēbāmus", "audiēbātis", "audiēbant"]'
  end

  def test_tense_block_returns_stringified_array
    assert_equal @aFourth.active_voice_indicative_mood_present_tense.to_s.class, String
  end

end
