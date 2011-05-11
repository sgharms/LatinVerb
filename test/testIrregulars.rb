#encoding:  UTF-8

require 'minitest/autorun'
require 'json'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics/latin/verb/classification_types'

# Internal dependencies

class TestIrregulars< MiniTest::Unit::TestCase # :nodoc:
  def ctest_to_give
    v =  Linguistics::Latin::Verb::LatinVerb.new 'dō dāre dedī datum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    assert_match /dāns/, v.present_active_participle
    assert_match /datus/, v.perfect_passive_participle
    assert_match /datūrus/, v.future_active_participle
    assert_match /dandus/, v.future_passive_participle

  end
  def ctest_to_eat
    v =  Linguistics::Latin::Verb::LatinVerb.new 'edō ēsse ēdī ēsum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    # Participles
    #assert_match /edēns/, v.present_active_participle
    #assert_equal '', v.perfect_passive_participle
    #assert_match 'ēsūrus', v.future_active_participle
    #assert_equal '', v.future_passive_participle
  end
  def ctest_to_be
    v = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    # Participles
    #assert_match 'ens', v.present_active_participle
    #assert_match '', v.perfect_passive_participle
    #assert_match 'futūrus', v.future_active_participle
    #assert_match '', v.future_passive_participle
  end
  def ctest_to_bear
    v = Linguistics::Latin::Verb::LatinVerb.new 'ferō ferre tulī lātum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

# Participles
    #assert_match %r'ferens', v.present_active_participle
    assert_match %r'lātus', v.perfect_passive_participle
    assert_match %r'lātūrus', v.future_active_participle
    #assert_match %r'ferendus', v.future_passive_participle

  end
  def ctest_to_go
    v = Linguistics::Latin::Verb::LatinVerb.new 'eō īre ivī itum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    # Participles
    assert_match %r'iēns', v.present_active_participle
    assert_match '', v.perfect_passive_participle
    assert_match %r'itūrus', v.future_active_participle
    #assert_match %r'eundum', v.future_passive_participle
  end
  def ctest_to_not_wish
    v = Linguistics::Latin::Verb::LatinVerb.new 'nolō nolle noluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    #assert_match 'nōlēns', v.present_active_participle
    #assert_equal '', v.perfect_passive_participle
    #assert_equal '', v.future_active_participle
    #assert_equal '', v.future_passive_participle
  end
  def ctest_to_prefer
    v = Linguistics::Latin::Verb::LatinVerb.new 'volō velle voluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
    #assert_match 'vōlēns', v.present_active_participle
    #assert_equal '', v.perfect_passive_participle
    #assert_equal '', v.future_active_participle
    #assert_equal '', v.future_passive_participle
  end
  def ctest_to_be_able
    v = Linguistics::Latin::Verb::LatinVerb.new 'queō quīre quīvī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    #assert_match 'quiēns', v.present_active_participle
    #assert_equal '', v.perfect_passive_participle
    #assert_equal '', v.future_active_participle
    #assert_equal '', v.future_passive_participle
  end
  def test_to_be_able2
    v = Linguistics::Latin::Verb::LatinVerb.new 'possum posse potuī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    assert_equal "possum",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "potes",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "potest",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "possumus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "potestis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "possunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "poteram", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "poterāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "poterō", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "poterimus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "potuī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "potuimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    #assert_equal "potueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    #assert_equal "potuerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "potuerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "potuerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "possim", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "possīs", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "possit", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "possīmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "possītis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "possint", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "possem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "possēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    #assert_equal '', v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    #second_equal '', v.active_voice_subjunctive_mood_present_tense_first_person_plural_number

    assert_equal "potuerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    #second_equal "potuerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "potuissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "potuissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    #assert_equal '', v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    #assert_equal '', v.active_voice_subjunctive_mood_present_tense_first_person_plural_number

    assert_equal "posse", v.present_active_infinitive
    assert_equal "potuisse", v.perfect_active_infinitive

    assert_match 'potēns', v.present_active_participle
    #assert_equal '', v.perfect_passive_participle
    #assert_equal '', v.future_active_participle
    #assert_equal '', v.future_passive_participle
  end
  def ctest_to_be_made
    v = Linguistics::Latin::Verb::LatinVerb.new 'fiō fiērī factus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
    #assert_match %r'faciēns', v.present_active_participle
    #assert_match %r'factus', v.perfect_passive_participle
    #assert_match %r'factūrus', v.future_active_participle
    #assert_match %r'faciendus', v.future_passive_participle
  end
  def ctest_to_help
    v = Linguistics::Latin::Verb::LatinVerb.new 'prōsum prōdesse prōfuī prōfutūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    #cf. A&G198
    assert_equal "prōsum",       v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "prōdēs",       v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "prōdest",       v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "prōsumus",     v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "prōdestis",     v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "prōsunt",      v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "prōderam",      v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "prōderāmus",      v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "prōderō",      v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "prōderimus",      v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "prōfuī",      v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "prōfuimus",      v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "prōfueram",      v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "prōfuerāmus",      v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "prōfuerō",      v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "prōfuerimus",      v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subjunctive
   
    assert_equal "prōsim",       v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "prōsīs",       v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "prōsit",       v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "prōsīmus",     v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "prōsītis",     v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "prōsint",      v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "prōdessem",      v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "prōdessēmus",      v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "prōfuerim",      v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "prōfuerimus",      v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "prōfuissem",      v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "prōfuissēmus",      v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    # Imperatives

    assert_equal "prōdēs", v.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal "prōdeste", v.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal "prōdestō",v.active_voice_imperative_mood_future_tense_second_person_singular_number 
    assert_equal "prōdestōte", v.active_voice_imperative_mood_future_tense_second_person_plural_number

    assert_equal 'prōdesse',  v.pres_act_inf
    assert_equal 'prōfuisse',  v.perfect_active_infinitive
    assert_equal 'prōfutūrum esse', v.future_active_infinitive

    # Participles
    assert_match   /prōfutūrus/, v.future_active_participle

  end
end
