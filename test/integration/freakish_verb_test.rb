#encoding:  UTF-8

require 'minitest/autorun'
require 'json'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics_latin'

# Internal dependencies

class FreakishVerbsTest < MiniTest::Unit::TestCase # :nodoc:
  def test_present_only?
    v =  Linguistics::Latin::Verb::LatinVerb.new 'maerō maēre maīvī maestum'
    assert v.present_only?, "Must be present_only: was #{v.classification}"
    assert_equal 6, v.active_voice_indicative_mood_perfect_tense.length, "active.indicative.perfect should have length of 6"
    assert_equal '',  v.active_voice_indicative_mood_perfect_tense_first_person_singular_number, "a perfect tense for a present only verb should be empty"
  end

  def test_present_only_from_sing
    v =  Linguistics::Latin::Verb::LatinVerb.new 'aiō'
    assert v.present_only?, "Must be present_only: was #{v.classification}"

    # Primary use of this verb

    assert_equal 'ait', v.active_voice_indicative_mood_present_tense_third_person_singular_number,
      "Must respond to active_voice_indicative_mood_present_tense_third_person_singular_number"

  end

  def test_very_odd_verbs
    choices = %w( quaesō ovāre )

    choices.each do |v|
      vi =  Linguistics::Latin::Verb::LatinVerb.new v
      assert vi.present_only?, "Must be present_only: was #{vi.classification}"
    end
  end

  def test_impersonal
    v =  Linguistics::Latin::Verb::LatinVerb.new 'pluit'
    assert_equal Linguistics::Latin::Verb::Classification::Impersonal, v.classification
    assert_equal 'pluit', v.active_voice_indicative_mood_present_tense_third_person_singular_number, "Impersonal verb must return third_person_singular_number"
  end

=begin rdoc
    * 191 - Irregular deponent verbs

    This section in A&G says that the following are irregular deponents,
    nevertheless a preliminary test on fruor did not show that.  I'm storing
    these here for reference, but do not believe this is a real issue to be
    addressed.

    adsentior, -īrī, adsēnsus, assent
    oblīvīscor, -ī, oblītus, forget.
    apīscor, (-ip-), -ī, aptus (-eptus), get
    opperior, -īrī, oppertus, await.
    dēfetīscor, -ī, -fessus, faint
    órdior, -īrī, órsus, begin.
    expergīscor, -ī, -perrēctus, rouse
    orior, -īrī, ortus (oritūrus), rise (3d
    experior, -īrī, expertus, try
    conjugation in most forms).
    fateor, -ērī, fassus, confess
    pacīscor, -ī, pactus, bargain.
    fruor, -ī, frūctus (fruitus), enjoy
    patior (-petior), -ī, passus (-pessus),
    fungor, -ī, fūnctus, fulfil
    gradior (-gredior), -ī, gressus, step
    -plector, -ī, -plexus, clasp.
    īrāscor, -ī, īrātus, be angry
    proficīscor, -ī, profectus, set out.
    lābor, -ī, lāpsus, fall
    queror, -ī, questus, complain.
    loquor, -ī, locūtus, speak
    reor, rērī, ratus, think.
    mētior, -īrī, mēnsus, measure
    revertor, -ī, reversus, return.
    -minīscor, -ī, -mentus, think
    ringor, -ī, rictus, snarl.
    morior, -ī, (-īrī), mortuus (moritūrus), die
    sequor, -ī, secūtus, follow.
    nancīscor, -ī, nactus (nānctus), find
    tueor, -ērī, tuitus (tūtus), defend.
    nāscor, -ī, nātus, be born
    ulcīscor, -ī, ultus, avenge.
    nītor, -ī, nīsus (nīxus), strive
    ūtor, -ī, ūsus, use, employ.
=end

  def test_irregular_deponents
    v =  Linguistics::Latin::Verb::LatinVerb.new 'fruor fruī frūctus '
    assert 'fruitur', v.active_voice_indicative_mood_present_tense_third_person_singular_number
  end
end
