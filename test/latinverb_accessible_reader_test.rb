require "minitest/autorun"
require "minitest/pride"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'

class LatinVerbAccessibleReaderTest < MiniTest::Unit::TestCase
  def setup
    @aFirst = Linguistics::Latin::Verb::LatinVerb.new 'amō amāre amāvī amatum'
  end

  def test_accessor
    assert_respond_to @aFirst, :original_string
    assert_respond_to @aFirst, :classification
    assert_respond_to @aFirst, :irregular?
    assert_respond_to @aFirst, :stem
  end
end
