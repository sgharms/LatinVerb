#encoding:  UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'latinverb/latinverb_classification_types'

# Internal dependencies

class TestDeponent < MiniTest::Unit::TestCase
  def setup
    @aDep = Linguistics::Latin::Verb::LatinVerb.new 'conor conarī conatus'
  end
  def test_basic_identification
    assert_equal Linguistics::Latin::Verb::VerbTypes::Deponent.to_s, @aDep.classification.to_s
  end
end
