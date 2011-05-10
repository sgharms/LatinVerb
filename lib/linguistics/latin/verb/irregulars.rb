# encoding: UTF-8

module Linguistics
  module Latin
    module Verb

        ## 
        # --
        # Recognized irregular verbs:
        # ###########################
        # 
        # Derived from A&G 197
        #
        #  -- Core Irregulars --
        # SUM_ESSE_FUĪ_FUTŪRUS
        # FERŌ_FERRE_TULĪ_LATUM
        # EŌ_ĪRE_IVĪ_ITUM
        #
        #  -- Verbs of Preference --
        # NOLŌ_NOLLE_NOLUĪ
        # VOLŌ_VELLE_VOLUĪ
        # MALŌ_MĀLLE_MALUĪ
        #
        # DŌ is irregular because its lengths are unusual and because there
        # are no first person, passive forms
        # 
        # * EDŌ
        # * QUEŌ
        # * FIŌ
        # * PROSUM
        #
        # ++
        ## 

        # Recognized irregular verb
        SUM_ESSE_FUĪ_FUTŪRUS=<<EOJSON 
        {
          "original string":"sum esse fuī futūrus",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active_voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "es",
                [],
                [],
                "este",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "erō",
                  "eris",
                  "erit",
                  "erimus",
                  "eritis",
                  "erunt"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fuerō",
                  "fueris",
                  "fuerit",
                  "fuerimus",
                  "fueritis",
                  "fuerint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "eram",
                  "erās",
                  "erat",
                  "erāmus",
                  "erātis",
                  "erant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fueram",
                  "fuerās",
                  "fuerat",
                  "fuerāmus",
                  "fuerātis",
                  "fuerant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fuī",
                  "fuistī",
                  "fuit",
                  "fuimus",
                  "fuistis",
                  "fuērunt (-ēre)"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "sum",
                  "es",
                  "est",
                  "sumus",
                  "estis",
                  "sunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "essem",
                  "essēs",
                  "esset",
                  "essēmus",
                  "essētis",
                  "essent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fuissem",
                  "fuissēs",
                  "fuisset",
                  "fuissēmus",
                  "fuissētis",
                  "fuissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fuerim",
                  "fueris",
                  "fuerit",
                  "fuerimus",
                  "fueritis",
                  "fuerint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "sim",
                  "sīs",
                  "sit",
                  "sīmus",
                  "sītis",
                  "sint"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              }
            }
        }
EOJSON

        # Recognized irregular verb
        FERŌ_FERRE_TULĪ_LATUM=<<EOJSON 
        {
          "original string":"ferō ferre tulī latum",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active_voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "fer",
                [],
                [],
                "ferte",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "feram",
                  "ferēs",
                  "feret",
                  "ferēmus",
                  "ferētis",
                  "ferent"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "tulerō",
                  "tuleris",
                  "tulerit",
                  "tulerimus",
                  "tuleritis",
                  "tulerint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferēbam",
                  "ferēbās",
                  "ferēbat",
                  "ferēbāmus",
                  "ferēbātis",
                  "ferēbant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "tuleram",
                  "tulerās",
                  "tulerat",
                  "tulerāmus",
                  "tulerātis",
                  "tulerant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "tulī",
                  "tulistī",
                  "tulit",
                  "tulimus",
                  "tulistis",
                  "tulērunt"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferō",
                  "fers",
                  "fert",
                  "ferimus",
                  "fertis",
                  "ferunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferrem",
                  "ferrēs",
                  "ferret",
                  "ferrēmus",
                  "ferrētis",
                  "ferrent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "tulissem",
                  "tulissēs",
                  "tulisset",
                  "tulissēmus",
                  "tulissētis",
                  "tulissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "tulerim",
                  "tuleris",
                  "tulerit",
                  "tulerimus",
                  "tuleritis",
                  "tulerint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "feram",
                  "ferās",
                  "ferat",
                  "ferāmus",
                  "ferātis",
                  "ferant"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferar",
                  "ferēris",
                  "ferētur", 
                  "ferēmur",
                  "ferēminī",
                  "ferentur"
                ]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["lātus erō", "lātus eris", "lātus erit",
                         "lātī erimus", "lātī eritis", "lātī erunt"]
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferēbar",
                  "ferēbāris",
                  "ferēbatur",
                  "ferēbāmur",
                  "ferēbāminī",
                  "ferēbantur"
                ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["lātus eram", "lātus erās", "lātus erat",
                         "lātī erāmus", "lātī erātis", "lātī erant"]
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["lātus sum", "lātus es", "lātus est",
                         "lātī sumus", "lātī estis", "lātī sunt"]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "feror",
                  "ferris",
                  "fertur",
                  "ferimur",
                  "feriminī",
                  "feruntur"
                ]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferrer",
                  "ferrēris",
                  "ferrētur",
                  "ferrēmur",
                  "ferrēminī",
                  "ferrentur"
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["lātus essem", "lātus essēs", "lātus esset",
                         "lātī essēumus", "lātī essētis", "lātī essent"]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["lātus sim", "lātus sīs", "lātus sit",
                         "lātī sīmus", "lātī sītis", "lātī sint"]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ferar",
                  "ferāris",
                  "ferātur",
                  "feamur",
                  "feraminī",
                  "ferantur"
                ]
              }
            }
        }
EOJSON
        # Recognized irregular verb
        EŌ_ĪRE_IVĪ_ITUM=<<EOJSON 
        {
          "original string":"eō īre ivī itum",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "i",
                [],
                [],
                "ite",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ībō",
                  "ībis",
                  "ībit",
                  "ībīmus",
                  "ībitis",
                  "ībunt"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ierō",
                  "ieris",
                  "ierit",
                  "ierimus",
                  "ieritis",
                  "ierint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ībam",
                  "ībās",
                  "ībat",
                  "ībāmus",
                  "ībātis",
                  "ībant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ieram",
                  "ierās",
                  "ierat",
                  "ierāmus",
                  "ierātis",
                  "ierant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ii",
                  "iistī",
                  "iit",
                  "iimus",
                  "iistis",
                  "iērunt"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "eō",
                  "īs",
                  "it",
                  "īmus",
                  "ītis",
                  "eunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "irem",
                  "irēs",
                  "iret",
                  "irēmus",
                  "irētis",
                  "irent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "īssem",
                  "īssēs",
                  "īsset",
                  "īssēmus",
                  "īssētis",
                  "īssent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ierim",
                  "ieris",
                  "ierit",
                  "ierimus",
                  "ieritis",
                  "ierint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "eam",
                  "eās",
                  "eat",
                  "eāmus",
                  "eātis",
                  "eant"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "ītur (Impersonal)", 
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","itum erit (Impersonal)","","",""]
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "ībātur",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","itum erat (Impersonal)","","",""]
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","itum est (Impersonal)","","",""]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "ītur",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "irētur (Impersonal)",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","itum esset (Impersonal)","","",""]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","itum sit (Impersonal)","","",""]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "eātur",
                  "",
                  ""
                ]
              }
          }
        }
EOJSON
        # Recognized irregular verb
        NOLŌ_NOLLE_NOLUĪ=<<EOJSON 
        {
          "original string":"nolō nolle noluī",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
              "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  [],
                  "nōli",
                  [],
                  [],
                  "nōlite",
                  []
                 ]
               },
              "active_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōlam",
                    "nōlēs",
                    "nōlet",
                    "nōlēmus",
                    "nōlētis",
                    "nōlent"
                  ]
                },
              "active_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōluerō",
                    "nōlueris",
                    "nōluerit",
                    "nōluerimus",
                    "nōlueritis",
                    "nōluerint"
                  ]
                },
              "active_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōlēbam",
                    "nōlēbās",
                    "nōlēbat",
                    "nōlēbāmus",
                    "nōlēbātis",
                    "nōlēbant"
                  ]
                },
              "active_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōlueram",
                    "nōluerās",
                    "nōluerat",
                    "nōluerāmus",
                    "nōluerātis",
                    "nōluerant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōluī",
                    "nōluistī",
                    "nōluit",
                    "nōluimus",
                    "nōluistis",
                    "nōluērunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nolō",
                    "nōn vīs",
                    "nōn vult",
                    "nōlumus",
                    "nōn vultis",
                    "nōlunt"
                  ]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōllem",
                    "nōllēs",
                    "nōllet",
                    "nōllēmus",
                    "nōllētis",
                    "nōllent"
                  ]
                },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōluissem",
                    "nōluissēs",
                    "nōluisset",
                    "nōluissēmus",
                    "nōluissētis",
                    "nōluissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōluerim",
                    "nōlueris",
                    "nōluerit",
                    "nōluerimus",
                    "nōlueritis",
                    "nōluerint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "nōlim",
                    "nōlis",
                    "nōlit",
                    "nōlimus",
                    "nōlitis",
                    "nōlint"
                  ]
                },
              "passive_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                }
            }
          }
EOJSON
        # Recognized irregular verb
        VOLŌ_VELLE_VOLUĪ=<<EOJSON 
        {
          "original string":"volō velle voluī",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
              "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
                },
              "active_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "volam",
                    "volēs",
                    "volet",
                    "volēmus",
                    "volētis",
                    "volent"
                  ]
                },
              "active_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "voluerō",
                    "volueris",
                    "voluerit",
                    "voluerimus",
                    "volueritis",
                    "voluerint"
                  ]
                },
              "active_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "volēbam",
                    "volēbās",
                    "volēbat",
                    "volēbāmus",
                    "volēbātis",
                    "volēbant"
                  ]
                },
              "active_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "volueram",
                    "voluerās",
                    "voluerat",
                    "voluerāmus",
                    "voluerātis",
                    "voluerant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "voluī",
                    "voluistī",
                    "voluit",
                    "voluimus",
                    "voluistis",
                    "voluērunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "volō",
                    "vīs",
                    "vult",
                    "volumus",
                    "vultis",
                    "volunt"
                  ]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "vellem",
                    "vellēs",
                    "vellet",
                    "vellēmus",
                    "vellētis",
                    "vellent"
                  ]
                },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "voluissem",
                    "voluissēs",
                    "voluisset",
                    "voluissēmus",
                    "voluissētis",
                    "voluissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "voluerim",
                    "volueris",
                    "voluerit",
                    "voluerimus",
                    "volueritis",
                    "voluerint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "velim",
                    "velīs",
                    "velit",
                    "velīmus",
                    "velītis",
                    "velint"
                  ]
                },
              "passive_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                }
              }
          }
EOJSON


        DŌ_DĀRE_DEDĪ_DATUM=<<EOJSON 
        {
          "original string":"dō dāre dedī datum",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active_voice_imperative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "dā",
                  "",
                  "",
                  "dāte",
                  ""
                ]
              },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dābō",
                  "dābis",
                  "dābit",
                  "dābimus",
                  "dābitis",
                  "dābunt"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dederō",
                  "dederis",
                  "dederit",
                  "dederimus",
                  "dederitis",
                  "dederint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dābam",
                  "dābās",
                  "dābat",
                  "dābāmus",
                  "dābātis",
                  "dābant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dederam",
                  "dederās",
                  "dederat",
                  "dederāmus",
                  "dederātis",
                  "dederant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dedī",
                  "dedistī",
                  "dedit",
                  "dedimus",
                  "dedistis",
                  "dedērunt"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dō",
                  "dās",
                  "dat",
                  "dāmus",
                  "dātis",
                  "dant"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dārem",
                  "dārēs",
                  "dāret",
                  "dārēmus",
                  "dārētis",
                  "dārent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dedissem",
                  "dedissēs",
                  "dedisset",
                  "dedissēmus",
                  "dedissētis",
                  "dedissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dederim",
                  "dederis",
                  "dederit",
                  "dederimus",
                  "dederitis",
                  "dederint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dem",
                  "dēs",
                  "det",
                  "dēmus",
                  "dētis",
                  "dent"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dābor",
                  "dāberis",
                  "dābitur",
                  "dābimur",
                  "dābiminī",
                  "dābuntur"
                ]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "datum erō",
                  "datum eris",
                  "datum erit",
                  "datum erimus",
                  "datum eritis",
                  "datum erint"
                ]
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dābar",
                  "dābāris",
                  "dābātur",
                  "dābāmur",
                  "dābāminī",
                  "dābantur"
                ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "datum eram",
                  "datum erās",
                  "datum erat",
                  "datum erāmus",
                  "datum erātis",
                  "datum erant"
                ]
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "datum sum",
                  "datum es",
                  "datum est",
                  "datum sumus",
                  "datum estis",
                  "datum sunt"
                ]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "dāris",
                  "dātur",
                  "dāmur",
                  "dāminī",
                  "dantur"
                ]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "dārer",
                  "dārēris",
                  "dārētur",
                  "dārēmur",
                  "dārēminī",
                  "dārentur"
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "[ datus, data, datum ] essem",
                  "[ datus, data, datum ] essēs",
                  "[ datus, data, datum ] esset",
                  "[ datī, datae, data ] essēmus",
                  "[ datī, datae, data ] essētis",
                  "[ datī, datae, data ] essent"
                ]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "[ datus, data, datum ] sim",
                  "[ datus, data, datum ] sis",
                  "[ datus, data, datum ] sit",
                  "[ datī, datae, data ] simus",
                  "[ datī, datae, data ] sitis",
                  "[ datī, datae, data ] sint"
                ]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "dēris",
                  "dētur",
                  "dēmur",
                  "dēminī",
                  "dentur"
                ]
             }
           }
          }
EOJSON

# EDŌ :  To eat

        EDŌ_ĒSSE_ĒDĪ_ĒSUM=<<EOJSON 
        {
          "original string":"EDŌ ĒSSE ĒDĪ ĒSUM",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active_voice_imperative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "ēs",
                  "",
                  "",
                  "ēste",
                  ""
                ]
              },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "edam",
                  "edēs",
                  "edet",
                  "edēmus",
                  "edētis",
                  "edent"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēderō",
                  "ēderis",
                  "ēderit",
                  "ēderīmus",
                  "ēderīits",
                  "ēderint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēdēbam",
                  "ēdēbās",
                  "ēdēbat",
                  "ēdēbāmus",
                  "ēdēbātis",
                  "ēdēbant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ederam",
                  "ederās",
                  "ederat",
                  "ederāmus",
                  "ederātis",
                  "ederant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "edī",
                  "edistī",
                  "edit",
                  "edimus",
                  "edistis",
                  "edērunt"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "edō",
                  "ēs (edis)",
                  "ēst (edit)",
                  "edimus",
                  "ēstis (editis)",
                  "edunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ederem",
                  "ēssēs (ederēs)",
                  "ēsset (ederet)",
                  "ēssēmus (ederēmus)",
                  "ēssētis (ederētis)",
                  "ēssent (ederent)"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēdissem",
                  "ēdissēs",
                  "ēdisset",
                  "ēdissēmus",
                  "ēdissētis",
                  "ēdissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēderim",
                  "ēderis",
                  "ēderit",
                  "ēderimus",
                  "ēderitis",
                  "ēderint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "edam (edim)",
                  "edās (edīs)",
                  "edat (edit)",
                  "edāmus (edīmus)",
                  "edātis (edītis)",
                  "edant (edint)"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "ēstur",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "ēssētur",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
             }
           }
          }
EOJSON

# QUEŌ: to be able

        QUEŌ_QUĪRE_QUĪVĪ=<<EOJSON 
        {
          "original string":"queō quīre quivī ",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "",
                [],
                [],
                "",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "quībō",
                  "",
                  "",
                  "",
                  "",
                  "quībunt"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "quībam",
                  "",
                  "quībat",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "quīvi",
                  "",
                  "quīvit",
                  "",
                  "",
                  "quīvērunt"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "queō",
                  "quīs",
                  "quit",
                  "quīmus",
                  "quītis",
                  "queunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "quīret",
                  "",
                  "",
                  "quīrent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  "quīvissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "quīverit",
                  "",
                  "",
                  "quīverint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "queam",
                  "queās",
                  "queat",
                  "queāmus",
                  "queātis",
                  "queant"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "", 
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","","","",""]
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","","","",""]
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","","","",""]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","","","",""]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": ["","","","","",""]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              }
          }
        }
EOJSON

#FIŌ:  To be made.  No active forms, efectively the passive form to faciō
        FIŌ_FIĒRĪ_FACTUS=<<EOJSON 
        {
          "original string":"sum esse fuī futūrus",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {

            "active_voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "",
                [],
                [],
                "",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  "(-ēre)"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  ""
                ]
             }, 
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  "",
                  "",
                  "",
                  "",
                  "" ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fiam",
                  "fiēs",
                  "fiet",
                  "fiēmus",
                  "fiētis",
                  "fient"]
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "factum erō",
                  "factum eris",
                  "factum erit",
                  "factum erimus",
                  "factum eritis",
                  "factum erint"]
              },

            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fiēbam",
                  "fiēbās",
                  "fiēbat",
                  "fiēbāmus",
                  "fiēbātis",
                  "fiēbant"
                  ]
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "factum eram",
                  "factum erās",
                  "factum erat",
                  "factum erāmus",
                  "factum erātis",
                  "factum erant"]
              },


            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "factum sum",
                  "factum es",
                  "factum est",
                  "factum sumus",
                  "factum estis",
                  "factum sunt"]
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fiō",
                  "fis",
                  "fīt",
                  "fīmus",
                  "fītis",
                  "fīunt"]
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fierem",
                  "fierēs",
                  "fieret",
                  "fierēmus",
                  "fierētis",
                  "fierent"
                ]
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "factum essem",
                  "factum essēs",
                  "factum esset",
                  "factum essēmus",
                  "factum essētis",
                  "factum essent"
                  ]
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "factum sim",
                  "factum sis",
                  "factum sit",
                  "factum simus",
                  "factum sitis",
                  "factum sint"]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fīam",
                  "fīās",
                  "fīat",
                  "fīamus",
                  "fīatis",
                  "fīant"]
              }







          }
        }
EOJSON

# PROSUM: To be of help, to be useful, benefit, profit

PRŌSUM_PRŌDESSE_PRŌFUĪ_PRŌFUTŪRUS=<<EOJSON 
        {
          "original string":"prōsum prōdesse prōfuī prōfutūrus",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "tense_blocks": {
            "active_voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "prōdes",
                [],
                [],
                "prōdeste",
                []
               ]
             },
            "active_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōderō",
                  "prōderis",
                  "prōderit",
                  "prōderimus",
                  "prōderitis",
                  "prōderunt"
                ]
              },
            "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "profuerō",
                  "profueris",
                  "profuerit",
                  "profuerimus",
                  "profueritis",
                  "profuerint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōderam",
                  "prōderās",
                  "prōderat",
                  "prōderāmus",
                  "prōderātis",
                  "prōderant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōfueram",
                  "prōfuerās",
                  "prōfuerat",
                  "prōfuerāmus",
                  "prōfuerātis",
                  "prōfuerant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōfuī",
                  "prōfuistī",
                  "prōfuit",
                  "prōfuimus",
                  "prōfuistis",
                  "prōfuērunt (-ēre)"
                ]
              },
            "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōsum",
                  "prōdes",
                  "prōdest",
                  "prōsumus",
                  "prōdestis",
                  "prōsunt"
                ]
              },
            "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōdessem",
                  "prōdessēs",
                  "prōdesset",
                  "prōdessēmus",
                  "prōdessētis",
                  "prōdessent"
                ]
              },
            "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōfuissem",
                  "prōfuissēs",
                  "prōfuisset",
                  "prōfuissēmus",
                  "prōfuissētis",
                  "prōfuissent"
                ]
              },
            "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōfuerim",
                  "prōfueris",
                  "prōfuerit",
                  "prōfuerimus",
                  "prōfueritis",
                  "prōfuerint"
                ]
              },
            "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "prōsim",
                  "prōsīs",
                  "prōsit",
                  "prōsīmus",
                  "prōsītis",
                  "prōsint"
                ]
              },
            "passive_voice_indicative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": []
              }
            }
        }
EOJSON

      end
    end
  end
