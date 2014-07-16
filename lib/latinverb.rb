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

# No dependencies
require 'latinverb/version'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/errors'
require 'latinverb/components/validator'

# Depends on nothing
require 'latinverb/tenses'

#===============================================================================

# Above here, things with no dependencies.....#
# ===============================================


#===============================================================================
#===============================================================================
# Hoi polloi hereunder

require 'latinverb/latinverb'

# Aim to extract me
require 'latinverb/abstract_cluster_factory'
require 'latinverb/imperatives_factory'
require 'latinverb/infinitves_factory'
require 'latinverb/participles_factory'

# Unaddressed
require 'latinverb/components/infinitivizer'
require 'latinverb/components/deponent_infinitivizer'
require 'latinverb/components/participler'
require 'latinverb/components/deponent_participler'
require 'latinverb/components/imperatives_handler'
require 'latinverb/components/deponent_imperatives_handler'
require 'latinverb/components/passive_infinitive_factory'
require 'latinverb/formatters/triplicate_and_pluralize_formatters'
require 'latinverb/imperative_block'

# TRYING TO BREAK OUT THE QUERENT FACTORY THING
# querent for classification building
#  Deps linguistics_latin, tense_block


# No dependencies
require 'latinverb/tense_method_definitions/active_voice_imperative_mood_future_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_imperative_mood_present_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_subjunctive_mood_perfect_tense_methods'

require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/irregular/tense_method_definitions/active_voice_imperative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_imperative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'

require 'latinverb/querent/querent_interface'
require 'latinverb/querent'

require 'latinverb/querent/first'
require 'latinverb/querent/second'
require 'latinverb/querent/third'
require 'latinverb/querent/third_io'
require 'latinverb/querent/fourth'

require 'latinverb/querent_factory' # *Regular* querents

require 'latinverb/querent_mutators/irregular'
require 'latinverb/irregular_verb_serialization_retriever'
require 'latinverb/querent_mutators/irregular/supine_inferrer.rb'
require 'latinverb/querent_mutators/irregular/json_deserializer'
require 'latinverb/querent/irregular'

require 'latinverb/past_and_perfect_tense_block_eclipser'

require 'latinverb/semideponent_querent_adapter/nullified_passive_voice_tense_blocks'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/semideponent_querent_adapter'

require 'latinverb/querent/impersonal'
require 'latinverb/querent/impersonal_verb_mixin'

require 'latinverb/querent_for_classification_strategy/regular'
require 'latinverb/querent_for_classification_strategy/irregular'
require 'latinverb/querent_for_classification_strategy/present_only'
require 'latinverb/querent_for_classification_strategy/deponent'
require 'latinverb/querent_for_classification_strategy/semideponent'
require 'latinverb/querent_for_classification_strategy/impersonal'

require 'latinverb/querent_for_classification_builder'
# /end building this giant snarl of querent for classification building
# /TRYING TO BREAK OUT THE QUERENT FACTORY THING

# Doesn't seem to be used
#require 'latinverb/querent_mutators/semideponent'

# Require me last
require 'latinverb/paradigmatic_verbs'
