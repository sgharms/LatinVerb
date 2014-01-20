require 'latinverb'

class TenseBlockTest < Minitest::Test
  def test_eachable
    stub = Linguistics::Latin::Verb::TenseBlock.new(%w/foo bar bat bin bang bob beetle/)
    assert_respond_to stub, :each, "Must respond to #each"
  end
end
