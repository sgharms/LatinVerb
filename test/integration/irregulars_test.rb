#encoding:  UTF-8

class IrregularsTest< Minitest::Test # :nodoc:
  def test_to_give
    v =  Linguistics::Latin::Verb::LatinVerb.new 'dō dāre dedī datum'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_match(/dāns/, v.present_active_participle)
    assert_match(/datus/, v.perfect_passive_participle)
    assert_match(/datūrus/, v.future_active_participle)
    assert_match(/dandus/, v.future_passive_participle)

  end
  def test_to_eat
    v =  Linguistics::Latin::Verb::LatinVerb.new 'edō ēsse ēdī ēsum'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "edō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_match %r"ēs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_match %r"ēst",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "edimus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_match %r"ēstis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "edunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "edēbam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "edēbāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "edam", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "edēmus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "ēdī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "ēdimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "ēderam", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "ēderāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "ēderō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "ēderimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_match %r"edam", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_match %r"edās", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_match %r"edat", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_match %r"edāmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_match %r"edātis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_match %r"edant", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_match %r"ederem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_match %r"ēssēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "ēderim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "ēderimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "ēdissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "ēdissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "ēsse", v.present_active_infinitive
    assert_equal "ēdisse", v.perfect_active_infinitive
    assert_match %r"ēsūru[ms]", v.future_active_infinitive
    assert_equal "", v.present_passive_infinitive
    assert_equal "", v.perfect_passive_infinitive
    assert_equal "", v.future_passive_infinitive

    # Participles
    assert_match /edēns/, v.present_active_participle
    assert_equal '', v.perfect_passive_participle
    assert_match %r'ēsūru[ms]', v.future_active_participle
    assert_equal '', v.future_passive_participle

    assert_equal "ēs", v.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal "ēste",v.active_voice_imperative_mood_present_tense_second_person_plural_number

  end
  def test_to_be
    v = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "sum",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "es",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "est",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "sumus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "estis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "sunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "eram", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "erāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "erō", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "erimus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "fuī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "fuimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "fueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "fuerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "fuerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "fuerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "sim", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "sīs", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "sit", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "sīmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "sītis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "sint", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_match %r"essem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_match %r"essēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "fuerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "fuerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "fuissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "fuissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "esse", v.present_active_infinitive
    assert_equal "fuisse", v.perfect_active_infinitive
    assert_match %r"futūru[ms]", v.future_active_infinitive
    assert_equal "", v.present_passive_infinitive
    assert_equal "", v.perfect_passive_infinitive
    assert_equal "", v.future_passive_infinitive


    assert_equal "es", v.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal "este",v.active_voice_imperative_mood_present_tense_second_person_plural_number

    # Participles
    assert_match 'ens', v.present_active_participle
    assert_match '', v.perfect_passive_participle
    assert_match 'futūrus', v.future_active_participle
    assert_match '', v.future_passive_participle

  end
  def test_to_bear
    v = Linguistics::Latin::Verb::LatinVerb.new 'ferō ferre tulī lātum'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "ferō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "fers",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "fert",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "ferimus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "feritis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "ferunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "ferēbam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "ferēbāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "feram", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "ferēmus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "tulī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "tulimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "tuleram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "tulerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "tulerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "tulerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "feram", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "ferās", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "ferat", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "ferāmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "ferātis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "ferant", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "ferrem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "ferrēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "tulerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "tulerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "tulissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "tulissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "ferre", v.present_active_infinitive
    assert_equal "tulisse", v.perfect_active_infinitive
    assert_match %r"lātūrus", v.future_active_infinitive
    assert_equal "ferrī", v.present_passive_infinitive
    assert_match %r"lātus", v.perfect_passive_infinitive
    assert_match %r"lātūrus īrī", v.future_passive_infinitive

    # Participles
    assert_match %r'ferēns', v.present_active_participle
    assert_match %r'lātus', v.perfect_passive_participle
    assert_match %r'lātūrus', v.future_active_participle
    assert_match %r'ferendus', v.future_passive_participle

    assert_match "lātū lātum", v.supine.values.join(' ')
  end
  def test_to_go
    v = Linguistics::Latin::Verb::LatinVerb.new 'eō īre ivī itum'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "eō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "īs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "it",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "īmus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "ītis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "eunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "ībam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "ībāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "ībō", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "ībimus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "iī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "iimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "ieram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "ierāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "ierō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "ierimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "eam", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "eās", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "eat", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "eāmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "eātis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "eant", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "īrem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "īrēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "ierim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "ierimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "īssem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "īssēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "īre", v.present_active_infinitive
    assert_equal "īsse", v.perfect_active_infinitive
    assert_match %r"itūru[ms]", v.future_active_infinitive
    assert_equal "īrī", v.present_passive_infinitive
    assert_match %r"itum esse", v.perfect_passive_infinitive
    assert_match %r"", v.future_passive_infinitive

    # Participles
    assert_match %r'iēns', v.present_active_participle
    assert_match '', v.perfect_passive_participle
    assert_match %r'itūrus', v.future_active_participle
    assert_match %r'eundum', v.future_passive_participle

  end

  def test_to_not_wish
    v = Linguistics::Latin::Verb::LatinVerb.new 'nōlō nōlle nōluī'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "nōlō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "nōn vīs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "nōn vult",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "nōlumus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "nōn vultis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "nōlunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "nōlēbam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "nōlēbāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "nōlam", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "nōlēmus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "nōluī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "nōluimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "nōlueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "nōluerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "nōluerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "nōluerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "nōlim", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "nōlis", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "nōlit", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "nōlimus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "nōlitis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "nōlint", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "nōllem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "nōllēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "nōluerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "nōluerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "nōluissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "nōluissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "nōlle", v.present_active_infinitive
    assert_equal "nōluisse", v.perfect_active_infinitive

    # Participles
    assert_match %r'nōlēns', v.present_active_participle
    assert_equal '', v.perfect_passive_participle
    assert_equal '', v.future_active_participle
    assert_equal '', v.future_passive_participle
  end

  def test_to_wish
    v = Linguistics::Latin::Verb::LatinVerb.new 'volō velle voluī'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "volō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "vīs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "vult",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "volumus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "vultis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "volunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "volēbam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "volēbāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "volam", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "volēmus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "voluī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "voluimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "volueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "voluerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "voluerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "voluerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "velim", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "velīs", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "velit", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "velīmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "velītis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "velint", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "vellem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "vellēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "voluerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "voluerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "voluerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "voluerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "voluissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "voluissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "velle", v.present_active_infinitive
    assert_equal "voluisse", v.perfect_active_infinitive

    # Participles
    assert_match %r'volēns', v.present_active_participle
    assert_equal '', v.perfect_passive_participle
    assert_equal '', v.future_active_participle
    assert_equal '', v.future_passive_participle
  end
  def test_to_be_able
    v = Linguistics::Latin::Verb::LatinVerb.new 'queō quīre quīvī'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "queō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "quīs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "quit",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "quīmus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "quītis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "queunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "quībam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "quībat", v.active_voice_indicative_mood_imperfect_tense_third_person_singular_number
    assert_equal "", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "quībō", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "quībunt", v.active_voice_indicative_mood_future_tense_third_person_plural_number

    assert_equal "quīvī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number

    assert_equal "", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "queam", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "queās", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "queat", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "queāmus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "queant", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "quīre", v.present_active_infinitive
    assert_equal "quīsse", v.perfect_active_infinitive
    assert_match "", v.future_active_infinitive
    assert_equal "", v.present_passive_infinitive
    assert_match "", v.perfect_passive_infinitive
    assert_match %r"", v.future_passive_infinitive

    # Participles
    assert_match %r'quiēns', v.present_active_participle
    assert_match '', v.perfect_passive_participle
    assert_match '', v.future_active_participle
    assert_match '', v.future_passive_participle

  end
  def test_to_be_able2
    v = Linguistics::Latin::Verb::LatinVerb.new 'possum posse potuī'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

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

    assert_equal "potueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "potuerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

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

    assert_equal 'possim', v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal 'possīmus', v.active_voice_subjunctive_mood_present_tense_first_person_plural_number

    assert_equal 'possem', v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal 'possēmus', v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "potuerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "potuerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "potuissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "potuissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "posse", v.present_active_infinitive
    assert_equal "potuisse", v.perfect_active_infinitive

    assert_match 'potēns', v.present_active_participle
    assert_equal '', v.perfect_passive_participle
    assert_equal '', v.future_active_participle
    assert_equal '', v.future_passive_participle
  end
  def test_to_be_made
    v = Linguistics::Latin::Verb::LatinVerb.new 'fiō fiērī factus'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "fiō",v.passive_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "fīs",v.passive_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "fit",v.passive_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "fīmus",v.passive_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "fītis",v.passive_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "fiunt",v.passive_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "fiēbam", v.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "fiēbāmus", v.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "fiam", v.passive_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "fiēmus", v.passive_voice_indicative_mood_future_tense_first_person_plural_number

    assert_match %r"factu[ms] sum", v.passive_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_match %r"factu[ms] sumus", v.passive_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_match %r"factu[ms] eram", v.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_match %r"factu[ms] erāmus", v.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_match %r"factu[ms] erō", v.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_match %r"factu[ms] erimus", v.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "fiam", v.passive_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "fiās", v.passive_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "fiat", v.passive_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "fiāmus", v.passive_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "fiātis", v.passive_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "fiant", v.passive_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "fierem", v.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "fierēmus", v.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_match %r"factu[ms] sim", v.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_match %r"factu[ms] sīmus", v.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_match %r"factu[ms] essem", v.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_match %r"factu[ms] essēmus", v.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "fierī", v.present_passive_infinitive
    assert_equal "factus esse", v.perfect_passive_infinitive

    assert_match %r'faciēns', v.present_active_participle
    assert_match %r'factus', v.perfect_passive_participle
    assert_match %r'factūrus', v.future_active_participle
    assert_match %r'faciendus', v.future_passive_participle
  end
  def test_to_help
    v = Linguistics::Latin::Verb::LatinVerb.new 'prōsum prōdesse prōfuī prōfutūrus'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

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

    assert_equal 'prōdesse',  v.present_active_infinitive

    assert_equal 'prōfuisse',  v.perfect_active_infinitive
    assert_match %r"prōfutūru[ms] esse", v.future_active_infinitive

    # Participles
    assert_match   /prōfutūrus/, v.future_active_participle

  end

  def test_to_prefer
    v = Linguistics::Latin::Verb::LatinVerb.new 'mālō mālle māluī'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification

    assert_equal "mālō",v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "māvīs",v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "māvult",v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "mālumus",v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "māvultis",v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "mālunt",v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "mālēbam", v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "mālēbāmus", v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "mālam", v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "mālēmus", v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "māluī", v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "māluimus", v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "mālueram", v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "māluerāmus", v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "māluerō", v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "māluerimus", v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subj.
    assert_equal "mālim", v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "mālis", v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "mālit", v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "mālimus", v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "mālitis", v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "mālint", v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "māllem", v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "māllēmus", v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "māluerim", v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "māluerimus", v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "māluissem", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "māluissēmus", v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    assert_equal "mālle", v.present_active_infinitive
    assert_equal "māluisse", v.perfect_active_infinitive

    # Participles
    assert_equal '', v.present_active_participle
    assert_equal '', v.perfect_passive_participle
    assert_equal '', v.future_active_participle
    assert_equal '', v.future_passive_participle
  end
  def test_to_be_meaning
    v = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
    assert_equal Linguistics::Latin::Verb::Classification::Irregular,  v.classification
    assert v.active_voice_indicative_mood_present_tense.meaning, "Irregulars should respond to meaning request."
    assert v.active_voice_indicative_mood_imperfect_tense.meaning
  end
end
