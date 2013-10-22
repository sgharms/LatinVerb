# encoding:  UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics_latin'

# Internal dependencies

class TestDeponentFourthConjugation < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'partior partīrī partītum'
  end

  def test_depo
    assert_equal(Linguistics::Latin::Verb::Classification::Deponent, @aDep.classification)

    assert_equal 'partior',     @aDep.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal 'partīris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal 'partītur',   @aDep.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal 'partīmur',   @aDep.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal 'partīminī',  @aDep.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal 'partiuntur',  @aDep.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal 'partiēbar',      @aDep.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal 'partiar',      @aDep.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal 'partītum sum',  @aDep.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal 'partītum eram', @aDep.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal 'partītum erō',  @aDep.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number

    # Subjunctives
    assert_equal 'partiar',   @aDep.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'partīrer',   @aDep.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert @aDep.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number =~ /partītus.*sim/
    assert @aDep.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number =~ /partītus.*essem/

    # Imperatives
    assert_equal 'partīre',   @aDep.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal 'partīminī',   @aDep.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal 'partītor',   @aDep.active_voice_imperative_mood_future_tense_second_person_singular_number

    # Infinitives

    assert_equal 'partīrī',   @aDep.present_active_infinitive
    assert  @aDep.perfect_active_infinitive =~ /partītus.*esse/
    assert @aDep.future_active_infinitive =~ /partītūrus.*esse/

    # Participles
    assert_equal 'partiēns, partientis', @aDep.present_active_participle
    assert  @aDep.future_active_participle =~ %r'partītūrus', "future_active_participle failed with: #{@aDep.future_active_participle}."
    assert  @aDep.perfect_active_participle =~ %r'partītus'
    assert @aDep.future_passive_participle =~ %r'partiendus'

    # Gerund
    assert @aDep.gerund =~ %r'partiendī', "Was not #{@aDep.gerund}"

    # Supine
    assert_equal 'partītum',  @aDep.supine[:accusative]
    assert_equal 'partītū',  @aDep.supine[:ablative]
  end


end
