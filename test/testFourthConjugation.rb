# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestLatinVerbFourthConj < MiniTest::Unit::TestCase # :nodoc:
  def setup
     @aFourth = Linguistics::Latin::Verb::LatinVerb.new 'audiō audīre audīvī auditum'
  end

  def test_supine
    assert_equal "auditum", @aFourth.supine[:accusative]
    assert_equal "auditū",  @aFourth.supine[:ablative]
  end

  def test_gerund
    assert @aFourth.gerund =~ %r'audiendī', "Was not #{@aFourth.gerund}"
    assert @aFourth.gerundive
  end

  def test_fourth_conj_exhaustively
    assert_equal "audiō",       @aFourth.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "audis",       @aFourth.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "audit",       @aFourth.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "audimus",     @aFourth.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "auditis",     @aFourth.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "audiunt",     @aFourth.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "audiēbam",    @aFourth.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "audiēbās",    @aFourth.active_voice_indicative_mood_imperfect_tense_second_person_singular_number
    assert_equal "audiēbat",    @aFourth.active_voice_indicative_mood_imperfect_tense_third_person_singular_number
    assert_equal "audiēbāmus",  @aFourth.active_voice_indicative_mood_imperfect_tense_first_person_plural_number
    assert_equal "audiēbātis",  @aFourth.active_voice_indicative_mood_imperfect_tense_second_person_plural_number
    assert_equal "audiēbant",   @aFourth.active_voice_indicative_mood_imperfect_tense_third_person_plural_number

    assert_equal "audiam",      @aFourth.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "audiēs",      @aFourth.active_voice_indicative_mood_future_tense_second_person_singular_number
    assert_equal "audiet",      @aFourth.active_voice_indicative_mood_future_tense_third_person_singular_number
    assert_equal "audiēmus",    @aFourth.active_voice_indicative_mood_future_tense_first_person_plural_number
    assert_equal "audiētis",    @aFourth.active_voice_indicative_mood_future_tense_second_person_plural_number
    assert_equal "audient",     @aFourth.active_voice_indicative_mood_future_tense_third_person_plural_number

    assert_equal "audīvī",      @aFourth.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "audīvistī",   @aFourth.active_voice_indicative_mood_perfect_tense_second_person_singular_number
    assert_equal "audīvit",     @aFourth.active_voice_indicative_mood_perfect_tense_third_person_singular_number
    assert_equal "audīvimus",   @aFourth.active_voice_indicative_mood_perfect_tense_first_person_plural_number
    assert_equal "audīvistis",  @aFourth.active_voice_indicative_mood_perfect_tense_second_person_plural_number
    assert_equal "audīvērunt",  @aFourth.active_voice_indicative_mood_perfect_tense_third_person_plural_number

    assert_equal "audīveram",   @aFourth.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "audīverās",   @aFourth.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number
    assert_equal "audīverat",   @aFourth.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number
    assert_equal "audīverāmus", @aFourth.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number
    assert_equal "audīverātis", @aFourth.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number
    assert_equal "audīverant",  @aFourth.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number

    assert_equal "audīverō",    @aFourth.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "audīveris",   @aFourth.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number
    assert_equal "audīverit",   @aFourth.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number
    assert_equal "audīverimus", @aFourth.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number
    assert_equal "audīveritis", @aFourth.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number
    assert_equal "audīverint",  @aFourth.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number

# Passive Present 

    assert_equal "audior",      @aFourth.passive_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "audīris",     @aFourth.passive_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "audītur",     @aFourth.passive_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "audīmur",     @aFourth.passive_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "audīminī",    @aFourth.passive_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "audiuntur",   @aFourth.passive_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "audiēbar",    @aFourth.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "audiēbāris",  @aFourth.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number
    assert_equal "audiēbātur",  @aFourth.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number
    assert_equal "audiēbāmur",  @aFourth.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number
    assert_equal "audiēbāminī", @aFourth.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number
    assert_equal "audiēbantur", @aFourth.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number

    assert_equal "audiar",      @aFourth.passive_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "audiēris",    @aFourth.passive_voice_indicative_mood_future_tense_second_person_singular_number
    assert_equal "audiētur",    @aFourth.passive_voice_indicative_mood_future_tense_third_person_singular_number
    assert_equal "audiēmur",    @aFourth.passive_voice_indicative_mood_future_tense_first_person_plural_number
    assert_equal "audiēminī",   @aFourth.passive_voice_indicative_mood_future_tense_second_person_plural_number
    assert_equal "audientur",   @aFourth.passive_voice_indicative_mood_future_tense_third_person_plural_number

# Passive perfect 
    assert_equal "auditum sum",    @aFourth.passive_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "auditum es",     @aFourth.passive_voice_indicative_mood_perfect_tense_second_person_singular_number
    assert_equal "auditum est",    @aFourth.passive_voice_indicative_mood_perfect_tense_third_person_singular_number
    assert_equal "auditum sumus",  @aFourth.passive_voice_indicative_mood_perfect_tense_first_person_plural_number
    assert_equal "auditum estis",  @aFourth.passive_voice_indicative_mood_perfect_tense_second_person_plural_number
    assert_equal "auditum sunt",   @aFourth.passive_voice_indicative_mood_perfect_tense_third_person_plural_number    

    assert_equal "auditum eram",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "auditum erās",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number
    assert_equal "auditum erat",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number
    assert_equal "auditum erāmus", @aFourth.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number
    assert_equal "auditum erātis", @aFourth.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number
    assert_equal "auditum erant",  @aFourth.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number                

    assert_equal "auditum erō",    @aFourth.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "auditum eris",   @aFourth.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number
    assert_equal "auditum erit",   @aFourth.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number
    assert_equal "auditum erimus", @aFourth.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number
    assert_equal "auditum eritis", @aFourth.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number
    assert_equal "auditum erint",  @aFourth.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number

### Subjunctives  
  # Active        
    assert_equal "audiam",       @aFourth.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "audiās",       @aFourth.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "audiat",       @aFourth.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "audiāmus",     @aFourth.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "audiātis",     @aFourth.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "audiant",      @aFourth.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "audīrem",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "audīrēs",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number
    assert_equal "audīret",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number
    assert_equal "audīrēmus",    @aFourth.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number
    assert_equal "audīrētis",    @aFourth.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number
    assert_equal "audīrent",     @aFourth.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number

    assert_equal "audīverim",    @aFourth.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "audīverīs",    @aFourth.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number
    assert_equal "audīverit",    @aFourth.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number
    assert_equal "audīverīmus",  @aFourth.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number
    assert_equal "audīverītis",  @aFourth.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number
    assert_equal "audīverint",   @aFourth.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number

    assert_equal "audīvissem",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "audīvissēs",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number
    assert_equal "audīvisset",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number
    assert_equal "audīvissēmus", @aFourth.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number
    assert_equal "audīvissētis", @aFourth.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number
    assert_equal "audīvissent",  @aFourth.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number

    #passive     
    assert_equal "audiar",                             @aFourth.passive_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "audiāris",                           @aFourth.passive_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "audiātur",                           @aFourth.passive_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "audiāmur",                           @aFourth.passive_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "audiāminī",                          @aFourth.passive_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "audiantur",                          @aFourth.passive_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "audīrer",                            @aFourth.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "audīrēris",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number
    assert_equal "audīrētur",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number
    assert_equal "audīrēmur",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number
    assert_equal "audīrēminī",                         @aFourth.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number
    assert_equal "audīrentur",                         @aFourth.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number

    assert_equal "[ auditus, audita, auditum ] sim",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "[ auditus, audita, auditum ] sis",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number
    assert_equal "[ auditus, audita, auditum ] sit",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number
    assert_equal "[ auditī, auditae, audita ] simus",  @aFourth.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number
    assert_equal "[ auditī, auditae, audita ] sitis",  @aFourth.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number
    assert_equal "[ auditī, auditae, audita ] sint",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number

    assert_equal "[ auditus, audita, auditum ] essem", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "[ auditus, audita, auditum ] essēs", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number
    assert_equal "[ auditus, audita, auditum ] esset", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number
    assert_equal "[ auditī, auditae, audita ] essēmus", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number
    assert_equal "[ auditī, auditae, audita ] essētis", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number
    assert_equal "[ auditī, auditae, audita ] essent",  @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number
 
    # Imperatives
    assert_equal "audī",   @aFourth.imperatives[0]
    assert_equal "audīte", @aFourth.imperatives[1]

    # Participles
    assert_equal"audiēns, audientis",              @aFourth.present_active_participle 
    assert_equal"auditūrus, auditūra, auditūrum",  @aFourth.future_active_participle
    assert_equal"auditus, audita, auditum",        @aFourth.perfect_passive_participle
    assert_equal"audiendus, audienda, audiendum",  @aFourth.future_passive_participle

    # Infinitves 
    assert_equal "audīre",                         @aFourth.present_active_infinitive
    assert_equal "audīvīsse",                      @aFourth.perfect_active_infinitive
    assert_equal "auditūrus esse",                 @aFourth.future_active_infinitive
    assert_equal "audīrī",                         @aFourth.present_passive_infinitive
    assert_equal "auditus, audita, auditum esse",  @aFourth.perfect_passive_infinitive    
    assert_equal "auditum īrī",                    @aFourth.future_passive_infinitive
  end

end
