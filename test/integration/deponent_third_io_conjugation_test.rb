# encoding:  UTF-8

class DeponentThirdConjugationTest < Minitest::Test # :nodoc:
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'patior patī passum'
  end

  def test_depo
    assert_equal(Linguistics::Latin::Verb::Classification::Deponent, @aDep.classification)

    assert_equal 'patior',     @aDep.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal 'pateris',   @aDep.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal 'patitur',   @aDep.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal 'patimur',   @aDep.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal 'patiminī',  @aDep.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal 'patiuntur',  @aDep.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal 'patiēbar',      @aDep.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal 'patiar',      @aDep.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal 'passum sum',  @aDep.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal 'passum eram', @aDep.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal 'passum erō',  @aDep.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number

    # Subjunctives
    assert_equal 'patiar',   @aDep.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'paterer',   @aDep.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert @aDep.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number =~ /passus.*sim/
    assert @aDep.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number =~ /passus.*essem/

    # Imperatives
    assert_equal 'patere',   @aDep.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal 'patiminī',   @aDep.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal 'patitor',   @aDep.active_voice_imperative_mood_future_tense_second_person_singular_number

    # Infinitives

    assert_equal 'patī',   @aDep.present_active_infinitive
    assert  @aDep.perfect_active_infinitive =~ /passus.*esse/
    assert @aDep.future_active_infinitive =~ /passūrus.*esse/

    # Participles
    assert_equal 'patiēns, patientis', @aDep.present_active_participle
    assert  @aDep.future_active_participle =~ %r'passūrus,'
    assert  @aDep.perfect_active_participle =~ %r'passus'
    assert @aDep.future_passive_participle =~ %r'patiendus'

    # Gerund
    assert @aDep.gerund =~ %r'patiendī', "Was not #{@aDep.gerund}"

    # Supine
    assert_equal 'passum',  @aDep.supine[:accusative]
    assert_equal 'passū',  @aDep.supine[:ablative]
  end

  def test_querent
    assert @aDep.querent, "Should find to a querent object"
    assert_equal 6,  @aDep.querent.active_voice_indicative_mood_present_tense.length
    assert_equal "patior", @aDep.querent.active_voice_indicative_mood_present_tense_first_person_singular_number
  end

end
