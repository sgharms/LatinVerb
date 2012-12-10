# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb/presenter'


class TestChart < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @o = Object.new
    @o.extend( Linguistics::Latin::Verb::LatinVerbPresenter )

    @first = [*1..6]
    @second = [*7..12]
    @third = [*14..19]
  end

  def test_verticalize
    final = @o.vertical_transform( [@first, @second, @third] ).last
    last = final.last
    label = final.first
    assert_equal 19, last
    assert_equal "3rd Pl.", label
  end

end
