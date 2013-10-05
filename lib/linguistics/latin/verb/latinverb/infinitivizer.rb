class Linguistics::Latin::Verb::Infinitivizer
  def initialize(verb)
    @verb = verb
  end

  def infinitives
    return {
      :present_active_infinitive  => present_active_infinitive,
      :perfect_active_infinitive  => perfect_active_infinitive,
      :future_active_infinitive   => future_active_infinitive,
      :present_passive_infinitive => present_passive_infinitive,
      :perfect_passive_infinitive => perfect_passive_infinitive,
      :future_passive_infinitive  => future_passive_infinitive
    }
  end

  def perfect_active_infinitive
    @verb.first_person_perfect+"sse"
  end

  def future_active_infinitive
    @verb.future_active_participle.sub(/,.*/,'') + " esse"
  end

  def present_passive_infinitive
    present_active_infinitive = @verb.present_active_infinitive
    verb_type = @verb.verb_type

    if verb_type == Linguistics::Latin::Verb::VerbTypes::First
      return  present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
    end
    if verb_type == Linguistics::Latin::Verb::VerbTypes::Second
      return present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
    end
    if verb_type == Linguistics::Latin::Verb::VerbTypes::ThirdIO
      return present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
    end
    if verb_type == Linguistics::Latin::Verb::VerbTypes::Third
      return present_active_infinitive.gsub(/(.*)ere$/,"\\1ī")
    end
    if verb_type == Linguistics::Latin::Verb::VerbTypes::Fourth
      return present_active_infinitive.gsub(/(.*)e$/,"\\1ī")
    end
  end

  def perfect_passive_infinitive
    @verb.perfect_passive_participle + " esse"
  end

  def future_passive_infinitive
    @verb.supine[:accusative] + " īrī"
  end
end
