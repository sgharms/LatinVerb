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
require 'latinverb_imperative_block'
require 'latinverb_type_evaluator'
require 'latinverb_querent_for_classification_builder'
require 'latinverb_irregular_infinitives_retriever'
require 'latinverb_irregular_imperatives_retriever'
require 'latinverb_irregular_participles_retriever'
require 'latinverb_imperatives'
require 'latinverb_infinitives'
require 'latinverb_participles'

# LatinVerb collaborator classes
require 'latinverb/version'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/validator'
require 'latinverb/tenses'

# Main library
require 'latinverb/latinverb'

# Some handy constants for getting paradigmatic verbs
require 'latinverb/paradigmatic_verbs'
