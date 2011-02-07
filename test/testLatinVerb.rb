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

def test_metaprogramming
  tc = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'

  # Test the real method that comes by part of the extension
  assert_respond_to(tc, :latin_active_voice_indicative_mood_imperfect_tense_singular_number_third_person)

  # Test the facade method
  assert_respond_to tc, :active_voice_indicative_mood_imperfect_tense_singular_number_third_person
  assert_respond_to tc, :respondable_methods

  # Make sure that stuff that /shouldn't/ be respected is not respected
  assert not( tc.respond_to? :zabumiwhorter)
  assert_raise do
    tc.zabumiwhorter
  end

end

def test_method_lookup
  tc = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  assert_respond_to tc, :active_voice_indicative_mood_imperfect_tense_singular_number_third_person

  # this should raise because we have not defined the 'cluster' method.  We've
  # defined that we want to respond, but need to do so via an intermediary
  # which, at the point of this assertion, has not been defined
  assert_raise do
    tc.active_voice_indicative_mood_imperfect_tense_singular_number_third_person
  end
end

def test_verbvector
  tc = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  assert_not_nil tc
  assert_not_nil tc.tense_list
  assert_not_nil tc.tense_list.length
  assert_equal 21, tc.tense_list.length
  assert_respond_to(tc, :active_voice_indicative_mood_imperfect_tense_singular_number_third_person)
  tc.tense_list.each do |cluster_method|
    assert_true tc.respond_to? cluster_method.to_sym
  end
  assert_equal 126,  tc.vector_list.length
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


#   
   
# end
