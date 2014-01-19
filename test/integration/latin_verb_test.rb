# encoding: UTF-8
require 'macronconversions'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class LatinVerbTest < MiniTest::Unit::TestCase # :nodoc:

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
      :@aFirstString   => Linguistics::Latin::Verb::Classification::Regular,
      :@aSecondString  => Linguistics::Latin::Verb::Classification::Regular,
      :@aThirdString   => Linguistics::Latin::Verb::Classification::Regular,
      :@aThirdIOString => Linguistics::Latin::Verb::Classification::Regular,
      :@aFourthString  => Linguistics::Latin::Verb::Classification::Regular
    }

    @verb_hash_verb_types = {
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
      'sum esse fuī futūrus',
      'ferō ferre tulī lātum',
      'eō īre ivī itum',
      'volō velle voluī',
      'nōlō nōlle nōluī'
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

    assert_respond_to tc, :active_voice_indicative_mood_imperfect_tense_third_person_singular_number

    # Make sure that stuff that /shouldn't/ be respected is not respected
    assert not( tc.respond_to? :zabumiwhorter), "Should not respond to :zabumiwhorter"
    assert_raises(NoMethodError) do
      tc.zabumiwhorter
    end
  end

  def test_vectors
    tc = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
    tense_list = tc.methods.grep(/tense\z/)
    assert tc
    assert_equal 22, tense_list.length

    assert_respond_to(tc, :active_voice_indicative_mood_imperfect_tense_third_person_singular_number)
    tense_list.each do |cluster_method|
      assert tc.respond_to? cluster_method.to_sym
    end
  end

  def test_defective_verbs
    defectives = ['meminī meminisse', 'ōdī ōdisse', 'coepī coepisse coeptum']
    defectives.reverse.each do |iv|
      v = Linguistics::Latin::Verb::LatinVerb.new(iv)
      assert v.irregular?
      assert_match( /.../ , v.active_voice_indicative_mood_perfect_tense_first_person_singular_number )

    end
  end

  def test_irregular_verbs
    @irregular_verb_strings.each do |iv|
      assert Linguistics::Latin::Verb::LatinVerb.new(iv).irregular?
    end
  end

  # Test the creation of stems
  def test_stem_production
    @verb_hash_utf8_style.each_pair do |k,v|
      assert_equal @verb_hash_stems[k], Linguistics::Latin::Verb::LatinVerb.new(v).stem
    end
  end

  # Test the classifications
  def test_classifications
    @verb_hash_utf8_style.each_pair do |k,v|
      c  = Linguistics::Latin::Verb::LatinVerb::LatinVerbClassifier.new(v)
      cf = c.classification
      assert_equal cf, @verb_hash_classifications[k]
    end
  end

  # Tests to see if the string that was given was sufficient to successfully create a LatinVerb
  def test_construction_validity
    @verb_hash_utf8_style.each_pair do |k,s|
      aVerb = Linguistics::Latin::Verb::LatinVerb.new s
      assert aVerb.valid?
      assert aVerb.classification
      assert aVerb.short_class
      assert aVerb.stem
      assert aVerb.conjugation
      assert_equal 4,  aVerb.principal_parts.length
      assert(aVerb.respond_to? :irregular?)
      assert !aVerb.irregular?
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

# end
