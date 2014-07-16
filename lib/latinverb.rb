require 'forwardable'
require 'json'
require 'yaml'

require 'linguistics_latin'
require 'linguistics_latin_tense_block'

require 'latinverb_classifier'
require 'latinverb_principal_parts_extractor'
require 'latinverb_stem_deriver'
require 'latinverb_type_evaluator'
require 'latinverb_imperative_block'
require 'latinverb_querent_for_classification_builder'

require 'latinverb/version'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/errors'
require 'latinverb/components/validator'
require 'latinverb/tenses'

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

require 'latinverb/formatters/triplicate_and_pluralize_formatters'

require 'latinverb/latinverb'

require 'latinverb/paradigmatic_verbs'
