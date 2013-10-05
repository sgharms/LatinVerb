# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestLatinVerbSecondConj < MiniTest::Unit::TestCase # :nodoc:
  def setup
    @aSecond = Linguistics::Latin::Verb::LatinVerb.new 'moneō monēre monuī monitum'
  end

  def test_partial #:nodoc:
    tp =  @aSecond.active_voice_indicative_mood_present_tense
    assert_equal "monet", tp[2]
    assert_equal 6, tp.length
  end
end
