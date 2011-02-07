# encoding: UTF-8

require "test/unit"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestLatinVerbFirstConj < Test::Unit::TestCase
  def setup
    @lv = Linguistics::Latin::Verb::LatinVerb.new 'moneō monēre monuī monitum'
  end

#   def test_second_conj_exhaustively
#       assert_equal("moneō",   @aSecond.active_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#       assert_equal("monēs",   @aSecond.active_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#       assert_equal("monet",   @aSecond.active_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#       assert_equal("monēmus", @aSecond.active_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#       assert_equal("monētis", @aSecond.active_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#       assert_equal("monent",  @aSecond.active_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monēbam",   @aSecond.active_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monēbās",   @aSecond.active_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monēbat",   @aSecond.active_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monēbāmus", @aSecond.active_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monēbātis", @aSecond.active_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monēbant",  @aSecond.active_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monēbō",    @aSecond.active_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#       assert_equal("monēbis",   @aSecond.active_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#       assert_equal("monēbit",   @aSecond.active_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#       assert_equal("monēbimus", @aSecond.active_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#       assert_equal("monēbitis", @aSecond.active_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#       assert_equal("monēbunt",  @aSecond.active_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monuī",     @aSecond.active_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#       assert_equal("monuistī",  @aSecond.active_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#       assert_equal("monuit",    @aSecond.active_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#       assert_equal("monuimus",  @aSecond.active_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#       assert_equal("monuistis", @aSecond.active_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#       assert_equal("monuērunt", @aSecond.active_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monueram",   @aSecond.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monuerās",   @aSecond.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monuerat",   @aSecond.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monuerāmus", @aSecond.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monuerātis", @aSecond.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monuerant",  @aSecond.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monuerō",    @aSecond.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monueris",   @aSecond.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monuerit",   @aSecond.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monuerimus", @aSecond.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monueritis", @aSecond.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monuerint",  @aSecond.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#   # Passive Present
# 
#       assert_equal("moneor",   @aSecond.passive_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#       assert_equal("monēris",  @aSecond.passive_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#       assert_equal("monētur",  @aSecond.passive_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#       assert_equal("monēmur",  @aSecond.passive_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#       assert_equal("monēminī", @aSecond.passive_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#       assert_equal("monentur", @aSecond.passive_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monēbar",    @aSecond.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monēbāris",  @aSecond.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monēbātur",  @aSecond.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monēbāmur",  @aSecond.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monēbāminī", @aSecond.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monēbantur", @aSecond.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monēbor",    @aSecond.passive_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#       assert_equal("monēberis",  @aSecond.passive_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#       assert_equal("monēbitur",  @aSecond.passive_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#       assert_equal("monēbimur",  @aSecond.passive_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#       assert_equal("monēbiminī", @aSecond.passive_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#       assert_equal("monēbuntur", @aSecond.passive_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#   # Passive perfect
#       assert_equal("monitum sum",   @aSecond.passive_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#       assert_equal("monitum es",    @aSecond.passive_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#       assert_equal("monitum est",   @aSecond.passive_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#       assert_equal("monitum sumus", @aSecond.passive_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#       assert_equal("monitum estis", @aSecond.passive_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#       assert_equal("monitum sunt",  @aSecond.passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)    
#                    
#       assert_equal("monitum eram",   @aSecond.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monitum erās",   @aSecond.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monitum erat",   @aSecond.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monitum erāmus", @aSecond.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monitum erātis", @aSecond.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monitum erant",  @aSecond.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)                
#                    
#       assert_equal("monitum erō",    @aSecond.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monitum eris",   @aSecond.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monitum erit",   @aSecond.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monitum erimus", @aSecond.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monitum eritis", @aSecond.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monitum erint",  @aSecond.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#   ### Subjunctives
#     # Active
#       assert_equal("moneam",   @aSecond.active_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#       assert_equal("moneās",   @aSecond.active_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#       assert_equal("moneat",   @aSecond.active_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#       assert_equal("moneāmus", @aSecond.active_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#       assert_equal("moneātis", @aSecond.active_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#       assert_equal("moneant",  @aSecond.active_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monērem",   @aSecond.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monēres",   @aSecond.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monēret",   @aSecond.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monēremus", @aSecond.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monēretis", @aSecond.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monērent",  @aSecond.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monuerim",   @aSecond.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#       assert_equal("monuerīs",   @aSecond.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#       assert_equal("monuerit",   @aSecond.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#       assert_equal("monuerīmus", @aSecond.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#       assert_equal("monuerītis", @aSecond.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#       assert_equal("monuerint",  @aSecond.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
#                    
#       assert_equal("monuissem",   @aSecond.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#       assert_equal("monuissēs",   @aSecond.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#       assert_equal("monuisset",   @aSecond.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#       assert_equal("monuissēmus", @aSecond.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#       assert_equal("monuissētis", @aSecond.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#       assert_equal("monuissent",  @aSecond.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#     #passive
#     assert_equal("monear",                              @aSecond.passive_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#     assert_equal("moneāris",                            @aSecond.passive_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#     assert_equal("moneātur",                            @aSecond.passive_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#     assert_equal("moneāmur",                            @aSecond.passive_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#     assert_equal("moneāminī",                           @aSecond.passive_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#     assert_equal("moneantur",                           @aSecond.passive_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
#                  
#     assert_equal("monērer",                             @aSecond.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#     assert_equal("monērēris",                           @aSecond.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#     assert_equal("monērētur",                           @aSecond.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#     assert_equal("monērēmur",                           @aSecond.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#     assert_equal("monērēminī",                          @aSecond.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#     assert_equal("monērentur",                          @aSecond.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
#                  
#     assert_equal("[ monitus, monita, monitum ] sim",    @aSecond.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#     assert_equal("[ monitus, monita, monitum ] sis",    @aSecond.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#     assert_equal("[ monitus, monita, monitum ] sit",    @aSecond.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] simus",   @aSecond.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] sitis",   @aSecond.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] sint",    @aSecond.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
#                  
#     assert_equal("[ monitus, monita, monitum ] essem",  @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#     assert_equal("[ monitus, monita, monitum ] essēs",  @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#     assert_equal("[ monitus, monita, monitum ] esset",  @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] essēmus", @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] essētis", @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#     assert_equal("[ monitī, monitae, monita ] essent",  @aSecond.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
#                  
#     # Imperatives
#     assert_equal("monē",   @aSecond.imperatives[0].to_s)
#     assert_equal("monēte", @aSecond.imperatives[1].to_s)
#                  
#     # Participles
#     assert_equal("monēns, monentis",                 @aSecond.present_active_participle )
#     assert_equal("monitūrus, monitūra, monitūrum",   @aSecond.future_active_participle)
#     assert_equal("monitus, monita, monitum",         @aSecond.perfect_passive_participle)
#     assert_equal("monendus, monenda, monendum",      @aSecond.future_passive_participle)
# 
#     # Infinitves
#     assert_equal("monēre",                        @aSecond.present_active_infinitive.to_s)
#     assert_equal("monuīsse",                      @aSecond.perfect_active_infinitive)
#     assert_equal("monitūrus esse",                @aSecond.future_active_infinitive)
#     assert_equal("monērī",                          @aSecond.present_passive_infinitive)
#     assert_equal("monitus, monita, monitum esse", @aSecond.perfect_passive_infinitive)    
#   end 
#   
#   def test_third_conj_exhaustively
#         assert_equal("agō",      @aThird.active_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("agis",     @aThird.active_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("agit",     @aThird.active_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("agimus",   @aThird.active_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("agitis",   @aThird.active_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("agunt",    @aThird.active_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agēbam",   @aThird.active_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("agēbās",   @aThird.active_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("agēbat",   @aThird.active_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("agēbāmus", @aThird.active_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("agēbātis", @aThird.active_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("agēbant",  @aThird.active_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agam",     @aThird.active_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("agēs",     @aThird.active_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("aget",     @aThird.active_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("agēmus",   @aThird.active_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("agētis",   @aThird.active_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("agent",    @aThird.active_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#         assert_equal("ēgī",      @aThird.active_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("ēgistī",   @aThird.active_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("ēgit",     @aThird.active_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("ēgimus",   @aThird.active_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("ēgistis",  @aThird.active_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("ēgērunt",  @aThird.active_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("ēgeram",   @aThird.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("ēgerās",   @aThird.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("ēgerat",   @aThird.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("ēgerāmus", @aThird.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("ēgerātis", @aThird.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("ēgerant",  @aThird.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("ēgerō",    @aThird.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("ēgeris",   @aThird.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("ēgerit",   @aThird.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("ēgerimus", @aThird.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("ēgeritis", @aThird.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("ēgerint",  @aThird.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     # Passive Present 
# 
#         assert_equal("agor",      @aThird.passive_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("ageris",    @aThird.passive_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("agitur",    @aThird.passive_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("agimur",    @aThird.passive_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("agiminī",   @aThird.passive_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("aguntur",   @aThird.passive_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agēbār",    @aThird.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("agēbāris",  @aThird.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("agēbātur",  @aThird.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("agēbāmur",  @aThird.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("agēbāminī", @aThird.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("agēbāntur", @aThird.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agar",      @aThird.passive_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("agēris",    @aThird.passive_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("agētur",    @aThird.passive_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("agēmur",    @aThird.passive_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("agēminī",   @aThird.passive_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("agentur",   @aThird.passive_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#     # Passive perfect 
#         assert_equal("actum sum",    @aThird.passive_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("actum es",     @aThird.passive_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("actum est",    @aThird.passive_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("actum sumus",  @aThird.passive_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("actum estis",  @aThird.passive_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("actum sunt",   @aThird.passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)    
# 
#         assert_equal("actum eram",   @aThird.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("actum erās",   @aThird.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("actum erat",   @aThird.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("actum erāmus", @aThird.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("actum erātis", @aThird.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("actum erant",  @aThird.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)                
# 
#         assert_equal("actum erō",    @aThird.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("actum eris",   @aThird.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("actum erit",   @aThird.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("actum erimus", @aThird.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("actum eritis", @aThird.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("actum erint",  @aThird.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     ### Subjunctives  
#       # Active        
#         assert_equal("agam",      @aThird.active_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("agās",      @aThird.active_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("agat",      @aThird.active_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("agāmus",    @aThird.active_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("agātis",    @aThird.active_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("agant",     @aThird.active_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agerem",    @aThird.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("ageres",    @aThird.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("ageret",    @aThird.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("ageremus",  @aThird.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("ageretis",  @aThird.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("agerent",   @aThird.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("ēgerim",    @aThird.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("ēgerīs",    @aThird.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("ēgerit",    @aThird.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("ēgerīmus",  @aThird.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("ēgerītis",  @aThird.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("ēgerint",   @aThird.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("ēgissem",   @aThird.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("ēgissēs",   @aThird.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("ēgisset",   @aThird.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("ēgissēmus", @aThird.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("ēgissētis", @aThird.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("ēgissent",  @aThird.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         #passive     
#         assert_equal("agar",                          @aThird.passive_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("agāris",                        @aThird.passive_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("agātur",                        @aThird.passive_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("agāmur",                        @aThird.passive_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("agāminī",                       @aThird.passive_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("agantur",                       @aThird.passive_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("agerer",                        @aThird.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("agerēris",                      @aThird.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("agerētur",                      @aThird.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("agerēmur",                      @aThird.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("agerēminī",                     @aThird.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("agerentur",                     @aThird.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ actus, acta, actum ] sim",    @aThird.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ actus, acta, actum ] sis",    @aThird.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ actus, acta, actum ] sit",    @aThird.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ actī, actae, acta ] simus",   @aThird.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ actī, actae, acta ] sitis",   @aThird.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ actī, actae, acta ] sint",    @aThird.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ actus, acta, actum ] essem",  @aThird.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ actus, acta, actum ] essēs",  @aThird.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ actus, acta, actum ] esset",  @aThird.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ actī, actae, acta ] essēmus", @aThird.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ actī, actae, acta ] essētis", @aThird.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ actī, actae, acta ] essent",  @aThird.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         # Imperatives
#         assert_equal("age",   @aThird.imperatives[0].to_s)
#         assert_equal("agite", @aThird.imperatives[1].to_s)
# 
#         # Participles
#         assert_equal("agens, agentis",           @aThird.present_active_participle )
#         assert_equal("actūrus, actūra, actūrum", @aThird.future_active_participle)
#         assert_equal("actus, acta, actum",       @aThird.perfect_passive_participle)
#         assert_equal("agendus, agenda, agendum", @aThird.future_passive_participle)
# 
#         # Infinitves 
#         assert_equal("agere",                   @aThird.present_active_infinitive.to_s)
#         assert_equal("ēgīsse",                  @aThird.perfect_active_infinitive)
#         assert_equal("actūrus esse",            @aThird.future_active_infinitive)
#         assert_equal("agī",                     @aThird.present_passive_infinitive)
#         assert_equal("actus, acta, actum esse", @aThird.perfect_passive_infinitive)        
#   end 

end
