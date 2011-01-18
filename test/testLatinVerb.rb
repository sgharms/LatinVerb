# encoding: UTF-8
require 'macronconversions'

#  ...by others
require "test/unit"
require 'pp'

# Internal dependencies
require 'latinverb/latinverb_classification_types'
require 'latinverb/latinverb_classmethods.rb'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestLatinVerb < Test::Unit::TestCase

  def setup
    _create_paradigmatic_examples
  end

  def _create_paradigmatic_examples
    @verb_hash_latex_style = { 
      :@aFirstString   => %q{am\={o}   am\={a}re am\={a}v\={\i} amatum},
      :@aSecondString  => %q{mone\={o} mon\={e}re monu\={\i} monitum},
      :@aThirdString   => %q{ag\={o}   agere \={e}g\={\i} actum},
      :@aThirdIOString => %q{capi\={o} capere c\={e}p\={\i} capitum},
      :@aFourthString  => %q{audi\={o} aud\={\i}re aud\={\i}v\={\i} auditum}
    }

    @verb_hash_latex_style.each_pair do |k,v|
      instance_variable_set k, v.gsub(/(\s)+/, "\\1")
    end

    @verb_hash_utf8_style = {
      :@aFirstString   => 'amō amāre amāvī amatum', 
      :@aSecondString  => 'moneō monēre monuī monitum',
      :@aThirdString   => 'agō agere ēgī actum',
      :@aThirdIOString => 'capiō capere cēpī capitum',
      :@aFourthString  => 'audiō audīre audīvī auditum',
    }

    @verb_hash_classifications = {
      :@aFirstString   => Linguistics::Latin::Verb::VerbTypes::First,
      :@aSecondString  => Linguistics::Latin::Verb::VerbTypes::Second,
      :@aThirdString   => Linguistics::Latin::Verb::VerbTypes::Third,
      :@aThirdIOString => Linguistics::Latin::Verb::VerbTypes::ThirdIO,
      :@aFourthString  => Linguistics::Latin::Verb::VerbTypes::Fourth
    }

    @verb_hash_stems = {
      :@aFirstString   => "amā",
      :@aSecondString  => "monē",
      :@aThirdString   => "ag",
      :@aThirdIOString => "cap",
      :@aFourthString  => "aud"
    }

    @irregular_verb_strings = [
      "sum esse fuī futūrus",
      "fero ferre tuli latum",
      "eo īre ii tium"
    ]


    @verb_hash_participial_stems = {
      :@aFirstString   => "amā",
      :@aSecondString  => "monē",
      :@aThirdString   => "age",
      :@aThirdIOString => "capiē",
      :@aFourthString  => "audiē"
    }
    
  end 

def test_verbvector
  tc = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  assert_equal 21, tc.tense_list.length
  assert_respond_to(tc, :active_voice_indicative_mood_imperfect_tense_singular_number_third_person)
  tc.tense_list.each do |cluster_method|
    assert_true tc.respond_to? cluster_method.to_sym
  end
  assert_equal 147,  tc.method_extension_module.vector_list.length
  # Establish poxying up for these two collections
  # puts tc.vector_list
  # puts tc.tense_list.length
end

  # Test that irregular verbs raise an exception (until I find a better way to catch them...)
  def test_irregular_verbs
    @irregular_verb_strings.each do |iv|
      assert_raise Linguistics::Latin::Verb::Errors::IrregularVerbSpecificationError do
        j = Linguistics::Latin::Verb::LatinVerb.new iv
        j.classification_error.call if  j.irregular?
      end
        assert_true Linguistics::Latin::Verb::LatinVerb.new(iv).irregular?
    end
  end

  # Test the creation of stems
  def test_stem_production
    @verb_hash_utf8_style.each_pair do |k,v|
      assert_equal Linguistics::Latin::Verb::LatinVerb.calculate_stem(v.split(/\s+/)[1]),
        @verb_hash_stems[k]
    end 
  end

  # Test the classifications
  def test_classifications
    @verb_hash_utf8_style.each_pair do |k,v|
      assert_equal(@verb_hash_classifications[k],
         Linguistics::Latin::Verb::LatinVerb.classify(v))
    end
  end

  def test_participial_stem_creation
    @verb_hash_utf8_style.each_pair do |k,v|
      a = v.split /\s+/
      assert_equal(@verb_hash_participial_stems[k],
         Linguistics::Latin::Verb::LatinVerb.calculate_participial_stem(a[0], a[1]))
    end
  end

  # Tests to see if the string that was given was sufficient to successfully create a LatinVerb
  def test_construction_validity
    @verb_hash_utf8_style.each_pair do |k,s|
      aVerb = Linguistics::Latin::Verb::LatinVerb.new s
      assert_true aVerb.valid?
      assert_not_nil aVerb.classification
      assert_not_nil aVerb.short_class
      assert_not_nil aVerb.stem
      assert_not_nil aVerb.conjugation
      assert_equal 4,  aVerb.principal_parts.length
      assert_true(aVerb.respond_to? :irregular?)
      assert_false aVerb.irregular?
    end
  end

  # Make sure that the dependencies are working so that we know the
  # paradigmatic examples get created safely.
  def test_macron_conversions
    assert_equal('amō amāre amāvī amatum', 
                  Text::Latex::Util::Macronconversions.convert(@aFirstString))
    assert_equal( 'moneō monēre monuī monitum',
                   Text::Latex::Util::Macronconversions.convert(@aSecondString))
    assert_equal( 'agō agere ēgī actum',
                   Text::Latex::Util::Macronconversions.convert(@aThirdString))
    assert_equal( 'capiō capere cēpī capitum',
                   Text::Latex::Util::Macronconversions.convert(@aThirdIOString))
    assert_equal( 'audiō audīre audīvī auditum',
                   Text::Latex::Util::Macronconversions.convert(@aFourthString))
  end
end


#   def test_first_conj_exhaustively
#     assert_equal("amō",         @aFirst.active_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#     assert_equal("amās",        @aFirst.active_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#     assert_equal("amat",        @aFirst.active_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#     assert_equal("amāmus",      @aFirst.active_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#     assert_equal("amātis",      @aFirst.active_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#     assert_equal("amant",       @aFirst.active_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
#          
#     assert_equal("amābam",      @aFirst.active_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amābās",      @aFirst.active_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amābat",      @aFirst.active_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amābāmus",    @aFirst.active_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amābātis",    @aFirst.active_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amābant",     @aFirst.active_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
#     
#     assert_equal("amābō",       @aFirst.active_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#     assert_equal("amābis",      @aFirst.active_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#     assert_equal("amābit",      @aFirst.active_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#     assert_equal("amābimus",    @aFirst.active_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#     assert_equal("amābitis",    @aFirst.active_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#     assert_equal("amābunt",     @aFirst.active_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
#                          
#     assert_equal("amāvī",       @aFirst.active_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāvistī",    @aFirst.active_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāvit",      @aFirst.active_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāvimus",    @aFirst.active_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāvistis",   @aFirst.active_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#     assert_equal("amāvērunt",   @aFirst.active_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)
#     
#     assert_equal("amāveram",    @aFirst.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāverās",    @aFirst.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāverat",    @aFirst.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāverāmus",  @aFirst.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāverātis",  @aFirst.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amāverant",   @aFirst.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)
#     
#     assert_equal("amāverō",     @aFirst.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāveris",    @aFirst.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāverit",    @aFirst.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāverimus",  @aFirst.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāveritis",  @aFirst.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amāverint",   @aFirst.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
#                                  
#   # Passive Present
#  
#     assert_equal("amor",        @aFirst.passive_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#     assert_equal("amāris",      @aFirst.passive_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#     assert_equal("amātur",      @aFirst.passive_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#     assert_equal("amāmur",      @aFirst.passive_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#     assert_equal("amāminī",     @aFirst.passive_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#     assert_equal("amantur",     @aFirst.passive_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#     assert_equal("amābar",      @aFirst.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amābāris",    @aFirst.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amābātur",    @aFirst.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amābāmur",    @aFirst.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amābāminī",   @aFirst.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amābantur",   @aFirst.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#     assert_equal("amābor",      @aFirst.passive_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#     assert_equal("amāberis",    @aFirst.passive_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#     assert_equal("amābitur",    @aFirst.passive_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#     assert_equal("amābimur",    @aFirst.passive_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#     assert_equal("amābiminī",   @aFirst.passive_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#     assert_equal("amābuntur",   @aFirst.passive_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#   # Passive perfect
#     assert_equal("amatum sum",   @aFirst.passive_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#     assert_equal("amatum es",    @aFirst.passive_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#     assert_equal("amatum est",   @aFirst.passive_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#     assert_equal("amatum sumus", @aFirst.passive_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#     assert_equal("amatum estis", @aFirst.passive_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#     assert_equal("amatum sunt",  @aFirst.passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)    
# 
#     assert_equal("amatum eram",    @aFirst.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amatum erās",    @aFirst.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amatum erat",    @aFirst.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amatum erāmus",  @aFirst.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amatum erātis",  @aFirst.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amatum erant",   @aFirst.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)                
# 
#     assert_equal("amatum erō",     @aFirst.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amatum eris",    @aFirst.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amatum erit",    @aFirst.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amatum erimus",  @aFirst.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amatum eritis",  @aFirst.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amatum erint",   @aFirst.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
#  
#   ### Subjunctives
#     # Active
#     assert_equal("amem",         @aFirst.active_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#     assert_equal("amēs",         @aFirst.active_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#     assert_equal("amet",         @aFirst.active_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#     assert_equal("amēmus",       @aFirst.active_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#     assert_equal("amētis",       @aFirst.active_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#     assert_equal("ament",        @aFirst.active_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#     assert_equal("amārem",       @aFirst.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāres",       @aFirst.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāret",       @aFirst.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāremus",     @aFirst.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāretis",     @aFirst.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amārent",      @aFirst.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#     assert_equal("amāverim",     @aFirst.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāverīs",     @aFirst.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāverit",     @aFirst.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāverīmus",   @aFirst.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāverītis",   @aFirst.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#     assert_equal("amāverint",    @aFirst.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#     assert_equal("amāvissem",    @aFirst.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amāvissēs",    @aFirst.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amāvisset",    @aFirst.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amāvissēmus",  @aFirst.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amāvissētis",  @aFirst.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amāvissent",   @aFirst.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#     #passive
#     assert_equal("amer",                             @aFirst.passive_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#     assert_equal("amēris",                           @aFirst.passive_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#     assert_equal("amētur",                           @aFirst.passive_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#     assert_equal("amēmur",                           @aFirst.passive_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#     assert_equal("amēminī",                          @aFirst.passive_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#     assert_equal("amentur",                          @aFirst.passive_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
#  
#     assert_equal("amārer",                           @aFirst.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#     assert_equal("amārēris",                         @aFirst.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#     assert_equal("amārētur",                         @aFirst.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#     assert_equal("amārēmur",                         @aFirst.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#     assert_equal("amārēminī",                        @aFirst.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#     assert_equal("amārentur",                        @aFirst.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
#  
#     assert_equal("[ amatus, amata, amatum ] sim",    @aFirst.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#     assert_equal("[ amatus, amata, amatum ] sis",    @aFirst.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#     assert_equal("[ amatus, amata, amatum ] sit",    @aFirst.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] simus",   @aFirst.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] sitis",   @aFirst.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] sint",    @aFirst.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
#  
#     assert_equal("[ amatus, amata, amatum ] essem",  @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#     assert_equal("[ amatus, amata, amatum ] essēs",  @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#     assert_equal("[ amatus, amata, amatum ] esset",  @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] essēmus", @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] essētis", @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#     assert_equal("[ amatī, amatae, amata ] essent",  @aFirst.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
#  
#  
#     # Imperatives
#     assert_not_nil(@aFirst.imperatives)
#     assert_equal("amā",    @aFirst.imperatives[0].to_s)
#     assert_equal("amāte",  @aFirst.imperatives[1].to_s)
#  
#     # Participles
#     assert_equal("amāns, amantis",                @aFirst.present_active_participle )
#     assert_equal("amatūrus, amatūra, amatūrum",   @aFirst.future_active_participle)
#     assert_equal("amatus, amata, amatum",         @aFirst.perfect_passive_participle)
#     assert_equal("amandus, amanda, amandum",      @aFirst.future_passive_participle)
#  
#     # Infinitves
#     assert_equal("amāre", @aFirst.present_active_infinitive.to_s)
#     assert_equal("amāvīsse", @aFirst.perfect_active_infinitive)
#     assert_equal("amatūrus esse", @aFirst.future_active_infinitive)
#     assert_equal("amārī", @aFirst.present_passive_infinitive)
#     assert_equal("amatus, amata, amatum esse", @aFirst.perfect_passive_infinitive)    
#   end
# 
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
#   
#   def test_third_io_conj_exhaustively
#         assert_equal("capiō",      @aThirdIO.active_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("capis",      @aThirdIO.active_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("capit",      @aThirdIO.active_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("capimus",    @aThirdIO.active_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("capitis",    @aThirdIO.active_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("capiunt",    @aThirdIO.active_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("capiēbam",   @aThirdIO.active_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("capiēbās",   @aThirdIO.active_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("capiēbat",   @aThirdIO.active_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("capiēbāmus", @aThirdIO.active_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("capiēbātis", @aThirdIO.active_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("capiēbant",  @aThirdIO.active_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("capiam",     @aThirdIO.active_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("capiēs",     @aThirdIO.active_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("capiet",     @aThirdIO.active_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("capiēmus",   @aThirdIO.active_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("capiētis",   @aThirdIO.active_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("capient",    @aThirdIO.active_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#         assert_equal("cēpī",      @aThirdIO.active_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("cēpistī",   @aThirdIO.active_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("cēpit",     @aThirdIO.active_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("cēpimus",   @aThirdIO.active_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("cēpistis",  @aThirdIO.active_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("cēpērunt",  @aThirdIO.active_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("cēperam",   @aThirdIO.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("cēperās",   @aThirdIO.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("cēperat",   @aThirdIO.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("cēperāmus", @aThirdIO.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("cēperātis", @aThirdIO.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("cēperant",  @aThirdIO.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("cēperō",    @aThirdIO.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("cēperis",   @aThirdIO.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("cēperit",   @aThirdIO.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("cēperimus", @aThirdIO.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("cēperitis", @aThirdIO.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("cēperint",  @aThirdIO.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     # Passive Present 
# 
#         assert_equal("capior",        @aThirdIO.passive_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("caperis",       @aThirdIO.passive_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("capitur",       @aThirdIO.passive_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("capimur",       @aThirdIO.passive_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("capiminī",      @aThirdIO.passive_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("capiuntur",     @aThirdIO.passive_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("capiēbār",      @aThirdIO.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("capiēbāris",    @aThirdIO.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("capiēbātur",    @aThirdIO.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("capiēbāmur",    @aThirdIO.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("capiēbāminī",   @aThirdIO.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("capiēbāntur",   @aThirdIO.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("capiar",        @aThirdIO.passive_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("capiēris",      @aThirdIO.passive_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("capiētur",      @aThirdIO.passive_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("capiēmur",      @aThirdIO.passive_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("capiēminī",     @aThirdIO.passive_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("capientur",     @aThirdIO.passive_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#     # Passive perfect 
#         assert_equal("captum sum",    @aThirdIO.passive_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("captum es",     @aThirdIO.passive_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("captum est",    @aThirdIO.passive_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("captum sumus",  @aThirdIO.passive_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("captum estis",  @aThirdIO.passive_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("captum sunt",   @aThirdIO.passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)    
# 
#         assert_equal("captum eram",   @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("captum erās",   @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("captum erat",   @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("captum erāmus", @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("captum erātis", @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("captum erant",  @aThirdIO.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)                
# 
#         assert_equal("captum erō",    @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("captum eris",   @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("captum erit",   @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("captum erimus", @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("captum eritis", @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("captum erint",  @aThirdIO.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     ### Subjunctives  
#       # Active        
#         assert_equal("capiam",     @aThirdIO.active_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("capiās",     @aThirdIO.active_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("capiat",     @aThirdIO.active_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("capiāmus",   @aThirdIO.active_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("capiātis",   @aThirdIO.active_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("capiant",    @aThirdIO.active_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("caperem",    @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("caperes",    @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("caperet",    @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("caperemus",  @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("caperetis",  @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("caperent",   @aThirdIO.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("cēperim",    @aThirdIO.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("cēperīs",    @aThirdIO.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("cēperit",    @aThirdIO.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("cēperīmus",  @aThirdIO.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("cēperītis",  @aThirdIO.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("cēperint",   @aThirdIO.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("cēpissem",   @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("cēpissēs",   @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("cēpisset",   @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("cēpissēmus", @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("cēpissētis", @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("cēpissent",  @aThirdIO.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         #passive     
#         assert_equal("capiar",                           @aThirdIO.passive_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("capiāris",                         @aThirdIO.passive_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("capiātur",                         @aThirdIO.passive_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("capiāmur",                         @aThirdIO.passive_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("capiāminī",                        @aThirdIO.passive_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("capiantur",                        @aThirdIO.passive_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("caperer",                          @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("caperēris",                        @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("caperētur",                        @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("caperēmur",                        @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("caperēminī",                       @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("caperentur",                       @aThirdIO.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ captus, capta, captum ] sim",    @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ captus, capta, captum ] sis",    @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ captus, capta, captum ] sit",    @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ captī, captae, capta ] simus",   @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ captī, captae, capta ] sitis",   @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ captī, captae, capta ] sint",    @aThirdIO.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ captus, capta, captum ] essem",  @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ captus, capta, captum ] essēs",  @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ captus, capta, captum ] esset",  @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ captī, captae, capta ] essēmus", @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ captī, captae, capta ] essētis", @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ captī, captae, capta ] essent",  @aThirdIO.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         # Imperatives
#         assert_equal("cape",   @aThirdIO.imperatives[0].to_s)
#         assert_equal("capite", @aThirdIO.imperatives[1].to_s)
# 
#         # Participles
#         assert_equal("capiēns, capientis",             @aThirdIO.present_active_participle )
#         assert_equal("captūrus, captūra, captūrum",    @aThirdIO.future_active_participle)
#         assert_equal("captus, capta, captum",          @aThirdIO.perfect_passive_participle)
#         assert_equal("capiendus, capienda, capiendum", @aThirdIO.future_passive_participle)
# 
#         # Infinitves 
#         assert_equal("capere",                     @aThirdIO.present_active_infinitive.to_s)
#         assert_equal("cēpīsse",                    @aThirdIO.perfect_active_infinitive)
#         assert_equal("captūrus esse",              @aThirdIO.future_active_infinitive)
#         assert_equal("capī",                       @aThirdIO.present_passive_infinitive)
#         assert_equal("captus, capta, captum esse", @aThirdIO.perfect_passive_infinitive)    
#     
#   end 
#   
#   def test_fourth_conj_exhaustively
#         assert_equal("audiō",       @aFourth.active_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("audis",       @aFourth.active_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("audit",       @aFourth.active_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("audimus",     @aFourth.active_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("auditis",     @aFourth.active_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("audiunt",     @aFourth.active_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audiēbam",    @aFourth.active_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audiēbās",    @aFourth.active_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audiēbat",    @aFourth.active_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audiēbāmus",  @aFourth.active_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audiēbātis",  @aFourth.active_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audiēbant",   @aFourth.active_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audiam",      @aFourth.active_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("audiēs",      @aFourth.active_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("audiet",      @aFourth.active_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("audiēmus",    @aFourth.active_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("audiētis",    @aFourth.active_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("audient",     @aFourth.active_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīvī",      @aFourth.active_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīvistī",   @aFourth.active_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīvit",     @aFourth.active_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīvimus",   @aFourth.active_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīvistis",  @aFourth.active_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīvērunt",  @aFourth.active_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīveram",   @aFourth.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīverās",   @aFourth.active_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīverat",   @aFourth.active_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīverāmus", @aFourth.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīverātis", @aFourth.active_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīverant",  @aFourth.active_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīverō",    @aFourth.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīveris",   @aFourth.active_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīverit",   @aFourth.active_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīverimus", @aFourth.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīveritis", @aFourth.active_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīverint",  @aFourth.active_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     # Passive Present 
# 
#         assert_equal("audior",      @aFourth.passive_voice_indicative_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("audīris",     @aFourth.passive_voice_indicative_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("audītur",     @aFourth.passive_voice_indicative_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("audīmur",     @aFourth.passive_voice_indicative_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("audīminī",    @aFourth.passive_voice_indicative_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("audiuntur",   @aFourth.passive_voice_indicative_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audiēbār",    @aFourth.passive_voice_indicative_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audiēbāris",  @aFourth.passive_voice_indicative_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audiēbātur",  @aFourth.passive_voice_indicative_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audiēbāmur",  @aFourth.passive_voice_indicative_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audiēbāminī", @aFourth.passive_voice_indicative_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audiēbāntur", @aFourth.passive_voice_indicative_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audiar",      @aFourth.passive_voice_indicative_mood_future_tense_first_person_singular_number.to_s)
#         assert_equal("audiēris",    @aFourth.passive_voice_indicative_mood_future_tense_second_person_singular_number.to_s)
#         assert_equal("audiētur",    @aFourth.passive_voice_indicative_mood_future_tense_third_person_singular_number.to_s)
#         assert_equal("audiēmur",    @aFourth.passive_voice_indicative_mood_future_tense_first_person_plural_number.to_s)
#         assert_equal("audiēminī",   @aFourth.passive_voice_indicative_mood_future_tense_second_person_plural_number.to_s)
#         assert_equal("audientur",   @aFourth.passive_voice_indicative_mood_future_tense_third_person_plural_number.to_s)
# 
#     # Passive perfect 
#         assert_equal("auditum sum",    @aFourth.passive_voice_indicative_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("auditum es",     @aFourth.passive_voice_indicative_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("auditum est",    @aFourth.passive_voice_indicative_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("auditum sumus",  @aFourth.passive_voice_indicative_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("auditum estis",  @aFourth.passive_voice_indicative_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("auditum sunt",   @aFourth.passive_voice_indicative_mood_perfect_tense_third_person_plural_number.to_s)    
# 
#         assert_equal("auditum eram",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("auditum erās",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("auditum erat",   @aFourth.passive_voice_indicative_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("auditum erāmus", @aFourth.passive_voice_indicative_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("auditum erātis", @aFourth.passive_voice_indicative_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("auditum erant",  @aFourth.passive_voice_indicative_mood_pastperfect_tense_third_person_plural_number.to_s)                
# 
#         assert_equal("auditum erō",    @aFourth.passive_voice_indicative_mood_futureperfect_tense_first_person_singular_number.to_s)
#         assert_equal("auditum eris",   @aFourth.passive_voice_indicative_mood_futureperfect_tense_second_person_singular_number.to_s)
#         assert_equal("auditum erit",   @aFourth.passive_voice_indicative_mood_futureperfect_tense_third_person_singular_number.to_s)
#         assert_equal("auditum erimus", @aFourth.passive_voice_indicative_mood_futureperfect_tense_first_person_plural_number.to_s)
#         assert_equal("auditum eritis", @aFourth.passive_voice_indicative_mood_futureperfect_tense_second_person_plural_number.to_s)
#         assert_equal("auditum erint",  @aFourth.passive_voice_indicative_mood_futureperfect_tense_third_person_plural_number.to_s)
# 
#     ### Subjunctives  
#       # Active        
#         assert_equal("audiam",       @aFourth.active_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("audiās",       @aFourth.active_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("audiat",       @aFourth.active_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("audiāmus",     @aFourth.active_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("audiātis",     @aFourth.active_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("audiant",      @aFourth.active_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīrem",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīres",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīret",      @aFourth.active_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīremus",    @aFourth.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīretis",    @aFourth.active_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīrent",     @aFourth.active_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīverim",    @aFourth.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīverīs",    @aFourth.active_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīverit",    @aFourth.active_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīverīmus",  @aFourth.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīverītis",  @aFourth.active_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīverint",   @aFourth.active_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīvissem",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīvissēs",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīvisset",   @aFourth.active_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīvissēmus", @aFourth.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīvissētis", @aFourth.active_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīvissent",  @aFourth.active_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         #passive     
#         assert_equal("audiar",                             @aFourth.passive_voice_subjunctive_mood_present_tense_first_person_singular_number.to_s)
#         assert_equal("audiāris",                           @aFourth.passive_voice_subjunctive_mood_present_tense_second_person_singular_number.to_s)
#         assert_equal("audiātur",                           @aFourth.passive_voice_subjunctive_mood_present_tense_third_person_singular_number.to_s)
#         assert_equal("audiāmur",                           @aFourth.passive_voice_subjunctive_mood_present_tense_first_person_plural_number.to_s)
#         assert_equal("audiāminī",                          @aFourth.passive_voice_subjunctive_mood_present_tense_second_person_plural_number.to_s)
#         assert_equal("audiantur",                          @aFourth.passive_voice_subjunctive_mood_present_tense_third_person_plural_number.to_s)
# 
#         assert_equal("audīrer",                            @aFourth.passive_voice_subjunctive_mood_imperfect_tense_first_person_singular_number.to_s)
#         assert_equal("audīrēris",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_second_person_singular_number.to_s)
#         assert_equal("audīrētur",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number.to_s)
#         assert_equal("audīrēmur",                          @aFourth.passive_voice_subjunctive_mood_imperfect_tense_first_person_plural_number.to_s)
#         assert_equal("audīrēminī",                         @aFourth.passive_voice_subjunctive_mood_imperfect_tense_second_person_plural_number.to_s)
#         assert_equal("audīrentur",                         @aFourth.passive_voice_subjunctive_mood_imperfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ auditus, audita, auditum ] sim",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ auditus, audita, auditum ] sis",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ auditus, audita, auditum ] sit",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] simus",  @aFourth.passive_voice_subjunctive_mood_perfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] sitis",  @aFourth.passive_voice_subjunctive_mood_perfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] sint",   @aFourth.passive_voice_subjunctive_mood_perfect_tense_third_person_plural_number.to_s)
# 
#         assert_equal("[ auditus, audita, auditum ] essem", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number.to_s)
#         assert_equal("[ auditus, audita, auditum ] essēs", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_second_person_singular_number.to_s)
#         assert_equal("[ auditus, audita, auditum ] esset", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_third_person_singular_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] essēmus", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] essētis", @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_second_person_plural_number.to_s)
#         assert_equal("[ auditī, auditae, audita ] essent",  @aFourth.passive_voice_subjunctive_mood_pastperfect_tense_third_person_plural_number.to_s)
# 
#         # Imperatives
#         assert_equal("audī",   @aFourth.imperatives[0].to_s)
#         assert_equal("audīte", @aFourth.imperatives[1].to_s)
# 
#         # Participles
#         assert_equal("audiēns, audientis",             @aFourth.present_active_participle )
#         assert_equal("auditūrus, auditūra, auditūrum", @aFourth.future_active_participle)
#         assert_equal("auditus, audita, auditum",       @aFourth.perfect_passive_participle)
#         assert_equal("audiendus, audienda, audiendum", @aFourth.future_passive_participle)
# 
#         # Infinitves 
#         assert_equal("audīre",                        @aFourth.present_active_infinitive.to_s)
#         assert_equal("audīvīsse",                     @aFourth.perfect_active_infinitive)
#         assert_equal("auditūrus esse",                @aFourth.future_active_infinitive)
#         assert_equal("audīrī",                        @aFourth.present_passive_infinitive)
#         assert_equal("auditus, audita, auditum esse", @aFourth.perfect_passive_infinitive)    
#   end
#   
# end
