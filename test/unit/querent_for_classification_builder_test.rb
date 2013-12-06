require 'latinverb'

class QuerentForClassificationBuilderTest < Minitest::Unit::TestCase
  KEYS = [:Regular, :PresentOnly, :Impersonal ]

  def test_to_ensure_regular_querent_responds_to_defined_tense_methods
    KEYS.each do |key|
      verb_stub = OpenStruct.new(:short_class => key, :verb_type => :First)
      builder = Linguistics::Latin::Verb::LatinVerb::QuerentForClassificationBuilder.new(verb_stub)
      assert_respond_to builder.querent, :defined_tense_methods,  "All querents should support this method"
    end
  end

  def test_to_ensure_irregular_querent_responds_to_defined_tense_methods
    verb_stub = OpenStruct.new(:short_class => :Irregular,
                               :original_string => "ferō ferre tulī lātum",
                               :passive_perfect_participle => "lātum")
    builder = Linguistics::Latin::Verb::LatinVerb::QuerentForClassificationBuilder.new(verb_stub)
    assert_respond_to builder.querent, :defined_tense_methods,  "All querents should support this method"
  end

  def test_to_ensure_deponent_querent_responds_to_defined_tense_methods
    Linguistics::Latin::Verb::LatinVerb::DeponentStringDeriver.any_instance.stubs(:proxy_string).returns("vereō verēre PreventDeponentInfiniteRegress veritum")
    verb_stub = OpenStruct.new(:short_class => :Deponent, :original_string => 'stub', :verb_type => :First)
    builder = Linguistics::Latin::Verb::LatinVerb::QuerentForClassificationBuilder.new(verb_stub)
    assert_respond_to builder.querent, :defined_tense_methods,  "All querents should support this method"
  end

  def test_to_ensure_deponent_querent_responds_to_defined_tense_methods
    Linguistics::Latin::Verb::LatinVerb::DeponentStringDeriver.any_instance.stubs(:proxy_string).returns("vereō verēre PreventDeponentInfiniteRegress veritum")
    verb_stub = OpenStruct.new(:short_class => :Semideponent, :original_string => 'stub', :verb_type => :First)
    builder = Linguistics::Latin::Verb::LatinVerb::QuerentForClassificationBuilder.new(verb_stub)
    assert_respond_to builder.querent, :defined_tense_methods,  "All querents should support this method"
  end
end
