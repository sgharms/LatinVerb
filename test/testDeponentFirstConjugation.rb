# encoding:  UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics/latin/verb/classification_types'

# Internal dependencies

class TestDeponent < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'mīror mīrārī mīrātum'
  end

  def test_firstconj_depo
    assert_equal(Linguistics::Latin::Verb::Classification::Deponent, @aDep.classification)

    assert_equal 'mīror',     @aDep.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal 'mīrāris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal 'mīrātur',   @aDep.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal 'mīrāmur',   @aDep.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal 'mīrāminī',  @aDep.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal 'mīrantur',  @aDep.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal 'mīrābar',      @aDep.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal 'mīrābor',      @aDep.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal 'mīrātum sum',  @aDep.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal 'mīrātum eram', @aDep.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal 'mīrātum erō',  @aDep.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number

    # Subjunctives
    assert_equal 'mīrer',   @aDep.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'mīrārer',   @aDep.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert @aDep.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number =~ /mīrātus.*sim/
    assert @aDep.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number =~ /mīrātus.*essem/

    # Imperatives
    assert_equal 'mīrāre',   @aDep.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal 'mīrāminī',   @aDep.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal 'mīrātor',   @aDep.active_voice_imperative_mood_future_tense_second_person_singular_number

    # Infinitives

    assert_equal 'mīrārī',   @aDep.present_active_infinitive
    assert  @aDep.perfect_active_infinitive =~ /mīrātus.*esse/
    assert @aDep.future_active_infinitive =~ /mīrātūrus.*esse/

    # Participles
    assert_equal 'mīrāns, mīrantis', @aDep.present_active_participle
    assert  @aDep.future_active_participle =~ %r'mīrātūrus,'
    assert  @aDep.perfect_active_participle =~ %r'mīrātus'
    assert @aDep.future_passive_participle =~ %r'mīrandus'

    # Gerund
    assert @aDep.gerund =~ %r'mīrandī', "Was not #{@aDep.gerund}"

    # Supine
    assert_equal 'mīrātum',  @aDep.supine[:accusative]
    assert_equal 'mīrātū',  @aDep.supine[:ablative]
  end


end
