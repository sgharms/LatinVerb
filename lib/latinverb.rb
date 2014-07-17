require 'forwardable'
require 'json'
require 'yaml'

# Linguistic basics
require 'linguistics_latin'
require 'linguistics_latin_tense_block'

# LatinVerb assisting gems
require 'latinverb_classifier'
require 'latinverb_principal_parts_extractor'
require 'latinverb_stem_deriver'
require 'latinverb_type_evaluator'
require 'latinverb_imperative_block'
require 'latinverb_querent_for_classification_builder'

# LatinVerb collaborator classes
require 'latinverb/version'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/errors'
require 'latinverb/components/validator'
require 'latinverb/tenses'

# LatinVerb verbal noun, verbal adjectives, infinitives
require 'latinverb/abstract_cluster_factory'

require 'latinverb/imperatives_factory'
require 'latinverb/components/imperatives_handler'
require 'latinverb/components/irregular_imperatives_handler'
require 'latinverb/components/deponent_imperatives_handler'
require 'latinverb/imperative_block'

require 'latinverb/infinitves_factory'
require 'latinverb/components/infinitivizer'
require 'latinverb/components/irregular_infinitives_handler'
require 'latinverb/components/deponent_infinitivizer'
require 'latinverb/components/passive_infinitive_factory'

require 'latinverb/participles_factory'
require 'latinverb/components/participler'
require 'latinverb/components/irregular_participles_handler'
require 'latinverb/components/deponent_participler'

# Main library
require 'latinverb/latinverb'

# Some handy constants for getting paradigmatic verbs
require 'latinverb/paradigmatic_verbs'
