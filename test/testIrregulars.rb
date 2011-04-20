#encoding:  UTF-8

require 'minitest/autorun'
require 'json'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics/latin/verb/classification_types'

# Internal dependencies

class TestIrregulars< MiniTest::Unit::TestCase # :nodoc:
  def test_to_give
    v =  Linguistics::Latin::Verb::LatinVerb.new 'dō dāre dedī datum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_eat
    v =  Linguistics::Latin::Verb::LatinVerb.new 'edō ēsse ēdī ēsum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be
    v = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_bear
    v = Linguistics::Latin::Verb::LatinVerb.new 'ferō ferre tulī latum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_go
    v = Linguistics::Latin::Verb::LatinVerb.new 'eō īre ivī itum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_not_wish
    v = Linguistics::Latin::Verb::LatinVerb.new 'nolō nolle noluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_prefer
    v = Linguistics::Latin::Verb::LatinVerb.new 'volō velle voluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be_able
    v = Linguistics::Latin::Verb::LatinVerb.new 'queō quīre quīvī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be_made
    v = Linguistics::Latin::Verb::LatinVerb.new 'fiō fiērī factus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_help
    v = Linguistics::Latin::Verb::LatinVerb.new 'prōsum prōdesse prōfuī prōfutūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
end
