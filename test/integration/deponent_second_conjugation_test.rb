# encoding:  UTF-8

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics_latin'

# Internal dependencies

class DeponentSecondConjugationTest < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'vereor verērī veritum'
  end

  def test_fu
    assert_equal 'verēris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
  end

  def test_depo
    assert_equal(Linguistics::Latin::Verb::Classification::Deponent, @aDep.classification)

    assert_equal 'vereor',    @aDep.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal 'verēris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal 'verētur',   @aDep.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal 'verēmur',   @aDep.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal 'verēminī',  @aDep.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal 'verentur',  @aDep.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal 'verēbar',      @aDep.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal 'verēbor',      @aDep.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal 'veritum sum',  @aDep.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal 'veritum eram', @aDep.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal 'veritum erō',  @aDep.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number

    # Subjunctives
    assert_equal 'verear',   @aDep.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'verērer',   @aDep.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert @aDep.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number     =~ /veritus.*sim/
    assert @aDep.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number =~ /veritus.*essem/

    # Imperatives
    assert_equal 'verēre',   @aDep.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal 'verēminī', @aDep.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal 'verētor',  @aDep.active_voice_imperative_mood_future_tense_second_person_singular_number

    # Infinitives

    assert_equal 'verērī',   @aDep.present_active_infinitive
    assert  @aDep.perfect_active_infinitive =~ /veritus.*esse/
    assert @aDep.future_active_infinitive =~ /veritūrus.*esse/

    # Participles
    assert_equal 'verēns, verentis', @aDep.present_active_participle
    assert  @aDep.future_active_participle =~ %r'veritūrus,'
    assert  @aDep.perfect_active_participle =~ %r'veritus'
    assert @aDep.future_passive_participle =~ %r'verendus'

    # Gerund
    assert @aDep.gerund =~ %r'verendī', "Was not #{@aDep.gerund}"

    # Supine
    assert_equal 'veritum',  @aDep.supine[:accusative]
    assert_equal 'veritū',  @aDep.supine[:ablative]
  end

  def test_querent
    assert @aDep.querent, "Should find to a querent object"
    assert_equal 6,  @aDep.querent.active_voice_indicative_mood_present_tense.length
    assert_equal "vereor", @aDep.querent.active_voice_indicative_mood_present_tense_first_person_singular_number
  end

end
