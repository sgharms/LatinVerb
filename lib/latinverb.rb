require 'forwardable'

# Linguistic basics
require 'linguistics_latin'
require 'linguistics_latin_tense_block'

# LatinVerb-assisting gems
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
require 'latinverb_serialization'

require 'latinverb/version'
require 'latinverb/validator'
require 'latinverb/tense_block_names'

# Main library
require 'latinverb/latinverb'

# Some handy constants for getting paradigmatic verbs
require 'latinverb/paradigmatic_verbs'
