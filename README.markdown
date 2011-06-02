# LatinVerb

## DESCRIPTION

### SUMMARY

LatinVerb is a library, written in Ruby, that is used to make dealing with
verb objects, and in particular Latin verbs, easier.  By providing a
definitional string like: `amō amāre amāvī amatum`, LatinVerb will generate
the 100+ forms and allow you to access them via method calls like
`passive_voice_subjunctive_mood_imperfect_tense_third_person_singular_number`
and get back `amaretur`.  

### HANDLING AMBIGUITY

LatinVerb also has tolerances for ambiguity.  Where
passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person\_singular\_number
is considered a "full" vector that uniquely identifies one value, it is
possible to pass "incomplete" vectors such as
`passive\_voice\_subjunctive\_mood\_imperfect\_tense\_third\_person` which
would return two values (`amārētur` and `amārentur`).  Similarly, the person
could be dropped and the number included and three values would be returned:
`amārētur`, `amārēris`, and `amārer`.

### PHONETICS / PHONOGRAPHICS

This library deals with some particularities of Latin verbs:

* Handling Unicode storage of characters with a long sound (macron)
* Handling of macron removal as according to the pronunciation rules of Latin
  (before repeated vowel, before certain consonants at end of word, etc.) 
* Resolving certain vectors of specified forms: person, number, voice, mood, and
tense.

### DYNAMICITY

Importantly, none of the values shown for the verbs are statically defined
(save irregulars).  Rather, each and every conjugated verb form is generated on
the fly as a result of applying a heuristic transformation to the verb (i.e.
"take the stem and add such-and-such ending(s) to it").

### IRREGULAR / DEPONENT SUPPORT

LatinVerb also supports *irregular* and *deponent* verbs.  It also handles
some of the "odder" types of verb (perfect only, impersonal, present only).  

### IMPROVEMENTS

This is a complete overhaul of my earlier "LatinVerb" library.  The (1)
iteration did not have support for deponents or irregulars, nor was its
metaprogrammatic model as tight nor were various components properly
modularized.


## AUTHOR

Steven G. Harms (github@sgharms.oib.com)
