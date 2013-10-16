require 'minitest/autorun'
require 'minitest/pride'

class PrincipalPartsExtractorTest < Minitest::Unit::TestCase
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
      result = Linguistics::Latin::Verb::LatinVerb::LatinVerbPrincipalPartsExtractor.calculate_participial_stem(a[1], a[0])
      assert_equal(@verb_hash_participial_stems[k], result, "Should have extracted #{@verb_hash_participial_stems[k]} for #{v}")
    end
  end

end
