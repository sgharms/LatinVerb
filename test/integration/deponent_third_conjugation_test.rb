# encoding:  UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics/latin/verb/classification_types'

# Internal dependencies

class TestDeponentThirdConjugation < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'sequor sequī secūtum'
  end

  def test_depo
    assert_equal(Linguistics::Latin::Verb::Classification::Deponent, @aDep.classification)

    assert_equal 'sequor',     @aDep.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal 'sequeris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal 'sequitur',   @aDep.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal 'sequimur',   @aDep.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal 'sequiminī',  @aDep.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal 'sequuntur',  @aDep.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal 'sequēbar',      @aDep.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal 'sequar',      @aDep.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal 'secūtum sum',  @aDep.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal 'secūtum eram', @aDep.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal 'secūtum erō',  @aDep.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number

    # Subjunctives
    assert_equal 'sequar',   @aDep.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'sequerer',   @aDep.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert @aDep.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number =~ /secūtus.*sim/
    assert @aDep.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number =~ /secūtus.*essem/

    # Imperatives
    assert_equal 'sequere',   @aDep.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal 'sequiminī',   @aDep.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal 'sequitor',   @aDep.active_voice_imperative_mood_future_tense_second_person_singular_number

    # Infinitives

    assert_equal 'sequī',   @aDep.present_active_infinitive
    assert  @aDep.perfect_active_infinitive =~ /secūtus.*esse/
    assert @aDep.future_active_infinitive =~ /secūtūrus.*esse/

    # Participles
    assert_equal 'sequens, sequentis', @aDep.present_active_participle
    assert  @aDep.future_active_participle =~ %r'secūtūrus,'
    assert  @aDep.perfect_active_participle =~ %r'secūtus'
    assert @aDep.future_passive_participle =~ %r'sequendus'

    # Gerund
    assert @aDep.gerund =~ %r'sequendī', "Was not #{@aDep.gerund}"

    # Supine
    assert_equal 'secūtum',  @aDep.supine[:accusative]
    assert_equal 'secūtū',  @aDep.supine[:ablative]
  end


end
