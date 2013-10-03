# encoding: UTF-8

require "minitest/autorun"

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'


class TestDeserializeInfinitives < MiniTest::Unit::TestCase # :nodoc:
  def test_deser_basic
    json_string=<<EOJSON
      {
       "infinitives":{
         "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
         "data": {
           "present_active_infinitive": "amāre",
           "present_passive_infinitive": "amārī",

           "perfect_active_infinitive": "amāvīsse",
           "perfect_passive_infinitive": "amatum",

           "future_active_infinitive ": "amatūrus esse",
           "future_passive_infinitive": "amatum īri"
         }
       }
     }
EOJSON

    ds = JSON.load json_string
    ib = ds['infinitives']
    assert_equal 6, ib.infinitive_methods.length
    assert_equal 'amatum',  ib.perfect_passive_infinitive
    assert_equal 'amāre', ib.present_active_infinitive
  end

end
