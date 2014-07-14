#encoding: UTF-8

class LatinVerbAccessibleReaderTest < Minitest::Test
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
