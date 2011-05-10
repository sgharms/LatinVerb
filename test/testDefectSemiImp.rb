# encoding: UTF-8

require "minitest/autorun"
require 'pp'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestDefectSemiImp < MiniTest::Unit::TestCase # :nodoc:
  def test_semideponents
      
    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, 
      Linguistics::Latin::Verb::LatinVerb.new("audeō audēre ausus sum").classification

    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, 
      Linguistics::Latin::Verb::LatinVerb.new("gaudeō gaudēre gavisus sum ").classification

    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, 
      Linguistics::Latin::Verb::LatinVerb.new("soleō solēre solitus sum").classification

    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, 
      Linguistics::Latin::Verb::LatinVerb.new("fidō fidere fisus sum").classification

    # Test extensions of the four standard mappings
    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, 
      Linguistics::Latin::Verb::LatinVerb.new("confidō confidere confīsus sum").classification
  end

  def test_semideponent_exhaustively #:nodoc:
    f = Linguistics::Latin::Verb::LatinVerb.new "gaudeō gaudēre gāvīsus"
    assert_equal Linguistics::Latin::Verb::VerbTypes::Semideponent, f.classification

    assert_equal "gaudeō",       f.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "gaudēs",       f.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "gaudet",       f.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "gaudēmus",     f.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "gaudētis",     f.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "gaudent",      f.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "gaudēbam",     f.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "gaudēbās",     f.active_voice_indicative_mood_imperfect_tense_second_person_singular_number
    assert_equal "gaudēbat",     f.active_voice_indicative_mood_imperfect_tense_third_person_singular_number
    assert_equal "gaudēbāmus",   f.active_voice_indicative_mood_imperfect_tense_first_person_plural_number
    assert_equal "gaudēbātis",   f.active_voice_indicative_mood_imperfect_tense_second_person_plural_number
    assert_equal "gaudēbant",    f.active_voice_indicative_mood_imperfect_tense_third_person_plural_number
    
    assert_equal "gaudēbō",       f.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "gaudēbis",      f.active_voice_indicative_mood_future_tense_second_person_singular_number
    assert_equal "gaudēbit",      f.active_voice_indicative_mood_future_tense_third_person_singular_number
    assert_equal "gaudēbimus",    f.active_voice_indicative_mood_future_tense_first_person_plural_number
    assert_equal "gaudēbitis",    f.active_voice_indicative_mood_future_tense_second_person_plural_number
    assert_equal "gaudēbunt",     f.active_voice_indicative_mood_future_tense_third_person_plural_number

   assert_equal "gāvīsum sum",   f.active_voice_indicative_mood_perfect_tense_first_person_singular_number
   assert_equal "gāvīsum es",    f.active_voice_indicative_mood_perfect_tense_second_person_singular_number
   assert_equal "gāvīsum est",   f.active_voice_indicative_mood_perfect_tense_third_person_singular_number
   assert_equal "gāvīsum sumus", f.active_voice_indicative_mood_perfect_tense_first_person_plural_number
   assert_equal "gāvīsum estis", f.active_voice_indicative_mood_perfect_tense_second_person_plural_number
   assert_equal "gāvīsum sunt",  f.active_voice_indicative_mood_perfect_tense_third_person_plural_number

   assert_equal "gāvīsum eram",   f.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
   assert_equal "gāvīsum erās",    f.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number
   assert_equal "gāvīsum erat",   f.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number
   assert_equal "gāvīsum erāmus", f.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number
   assert_equal "gāvīsum erātis", f.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number
   assert_equal "gāvīsum erant",  f.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number

   assert_equal "gāvīsum erō",      f.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
   assert_equal "gāvīsum eris",      f.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number
   assert_equal "gāvīsum erit",      f.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number
   assert_equal "gāvīsum erimus",    f.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number
   assert_equal "gāvīsum eritis",    f.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number
   assert_equal "gāvīsum erint",     f.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number

   assert f.passive_voice_indicative_mood_perfect_tense.wordless?
   assert f.passive_voice_indicative_mood_pastperfect_tense.wordless?
   assert f.passive_voice_indicative_mood_futureperfect_tense.wordless?

   assert_equal "gaudeam", f.active_voice_subjunctive_mood_present_tense_first_person_singular_number
   assert_equal "gaudeās", f.active_voice_subjunctive_mood_present_tense_second_person_singular_number
   assert_equal "gaudeat", f.active_voice_subjunctive_mood_present_tense_third_person_singular_number
   assert_equal "gaudeāmus", f.active_voice_subjunctive_mood_present_tense_first_person_plural_number
   assert_equal "gaudeātis", f.active_voice_subjunctive_mood_present_tense_second_person_plural_number
   assert_equal "gaudeant",   f.active_voice_subjunctive_mood_present_tense_third_person_plural_number

   assert_equal "gaudērem", f.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
#here
   assert_equal "gaudērēs", f.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number
   assert_equal "gaudēret", f.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number
   #assert_equal "gaudērēmus", f.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number
   #assert_equal "gaudērētis", f.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number
   assert_equal "gaudērent",   f.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number
   
   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] sim", f.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] sis", f.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number
   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] sit", f.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] simus", f.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] sitis", f.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] sint",   f.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number

   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] essem", f.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] essēs", f.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number
   assert_equal "[ gāvīsus, gāvīsa, gāvīsum ] esset", f.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] essēmus", f.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] essētis", f.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number
   assert_equal "[ gāvīsī, gāvīsae, gāvīsa ] essent",   f.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number

   assert f.passive_voice_subjunctive_mood_perfect_tense.wordless?
   assert f.passive_voice_subjunctive_mood_pastperfect_tense.wordless?
  end
end
