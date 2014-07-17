require 'forwardable'
require 'json'
require 'yaml'

# Linguistic basics
require 'linguistics_latin'
require 'linguistics_latin_tense_block'
require 'linguistics_latin_imperative_block'

# LatinVerb assisting gems
require 'latinverb_classifier'
require 'latinverb_principal_parts_extractor'
require 'latinverb_stem_deriver'
require 'latinverb_type_evaluator'
#require 'latinverb_imperative_block'
require 'latinverb_querent_for_classification_builder'

# LatinVerb collaborator classes
require 'latinverb/version'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/errors'
require 'latinverb/validator'
require 'latinverb/tenses'

# LatinVerb verbal noun, verbal adjectives, infinitives
require 'latinverb/abstract_cluster_factory'

require 'latinverb/imperatives_factory'
require 'latinverb/imperatives_factory/imperatives_handler'
require 'latinverb/imperatives_factory/irregular_imperatives_handler'
require 'latinverb/imperatives_factory/deponent_imperatives_handler'

require 'latinverb/infinitves_factory'
require 'latinverb/infinitives_factory/infinitivizer'
require 'latinverb/infinitives_factory/irregular_infinitives_handler'
require 'latinverb/infinitives_factory/deponent_infinitivizer'
require 'latinverb/infinitives_factory/passive_infinitive_factory'

require 'latinverb/participles_factory'
require 'latinverb/participles_factory/participler'
require 'latinverb/participles_factory/irregular_participles_handler'
require 'latinverb/participles_factory/deponent_participler'

# Main library
require 'latinverb/latinverb'

# Some handy constants for getting paradigmatic verbs
require 'latinverb/paradigmatic_verbs'
