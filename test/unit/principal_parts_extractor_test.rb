#encoding: UTF-8

class PrincipalPartsExtractorTest < Minitest::Test
  def setup
    @verb_hash_utf8_style = {
      :@aFirstString   => 'amō amāre amāvī amatum',
      :@aSecondString  => 'moneō monēre monuī monitum',
      :@aThirdString   => 'agō agere ēgī actum',
      :@aThirdIOString => 'capiō capere cēpī capitum',
      :@aFourthString  => 'audiō audīre audīvī auditum',
    }
    @verb_hash_participial_stems = {
      :@aFirstString   => "amā",
      :@aSecondString  => "monē",
      :@aThirdString   => "age",
      :@aThirdIOString => "capiē",
      :@aFourthString  => "audiē"
    }
  end

  def test_participial_stem_creation
    @verb_hash_utf8_style.each_pair do |k,v|
      a = v.split( /\s+/ )
      stub_classifier = OpenStruct.new( deponent?: false, semideponent?: false, impersonal?: false, regular?: true)
      stub_verb = OpenStruct.new( classifier: stub_classifier, present_active_infinitive: a[1], first_person_singular: a[0] )
      result = Linguistics::Latin::Verb::LatinVerb::StemDeriver.new(stub_verb).participial_stem
      assert_equal(@verb_hash_participial_stems[k], result, "Should have extracted #{@verb_hash_participial_stems[k]} for #{v}")
    end
  end

end
