module StrategyHelper
  #
  ##
  #
  # === DESCRIPTION
  #
  # Used for handling verb states that are compounds like _amatus,
  # amata, amatum sum_ and converting them to amati, amatae, amata,
  # (sumus|estis|sunt).
  #
  # === ARGUMENTS
  #
  # +x:+ :: A string that looks like --us, --a, --um
  #         This method mutates those singular endings to plural forms
  #
  # === RETURNS
  #
  # Altered string
  #
  # === EXAMPLE
  #
  # pluralize_participial_listing(qq/amatus, amata, amatum/) #=>
  #   amatī, amatae, amata
  #
  ##
  def pluralize_participial_listing(x)
    x.sub!(/us,/,   'ī,' )
    x.sub!(/a,/,    'ae,')
    x.sub!(/um.*$/, 'a'  )
  end

  ##
  #
  # === DESCRIPTION
  #
  # Used for turning a participial form --um into --us, --a, --um
  #
  # === ARGUMENTS
  #
  # +s:+ :: --um
  #
  # === RETURNS
  #
  # Altered string
  #
  # === EXAMPLE
  #
  # triplicate_and_genderize("amatum") #=> amatus, amata, amatum
  #
  ##
  def triplicate_and_genderize(s)
    stem = s.sub(/^(.*)um$/,"\\1")
    [ stem + 'us',
      stem + 'a',
      s
    ].join(', ')
  end
end
