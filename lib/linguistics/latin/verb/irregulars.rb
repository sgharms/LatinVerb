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
        # FERŌ_FERRE_TULĪ_LĀTUM
        # EŌ_ĪRE_IVĪ_ITUM
        #
        #  -- Verbs of Preference --
        # NŌLŌ_NŌLLE_NŌLUĪ
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"ens, entis",
              "future_active_participle":"futūrus",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "esse",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "fuisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "futūrum esse",
              "future_passive_infinitive": ""
            }
          },
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
        FERŌ_FERRE_TULĪ_LĀTUM=<<EOJSON
        {
          "original string":"ferō ferre tulī lātum",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"ferēns, ferentis",
              "future_active_participle":"lātūrus",
              "perfect_passive_participle":"lātus",
              "future_passive_participle":"ferendus"
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "ferre",
              "present_passive_infinitive": "ferrī",

              "perfect_active_infinitive": "tulisse",
              "perfect_passive_infinitive": "lātus",

              "future_active_infinitive": "lātūrus esse",
              "future_passive_infinitive": "lātūrus īrī"
            }
          },
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
                  "feritis",
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"iēns (euntis)",
              "future_active_participle":"itūrus",
              "perfect_passive_participle":"",
              "future_passive_participle":"eundum"
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "īre",
              "present_passive_infinitive": "īrī",

              "perfect_active_infinitive": "īsse",
              "perfect_passive_infinitive": "itum esse",

              "future_active_infinitive": "itūrum esse",
              "future_passive_infinitive": ""
            }
          },
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
                  "ībimus",
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
                  "iī",
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
                  "īrem",
                  "īrēs",
                  "īret",
                  "īrēmus",
                  "īrētis",
                  "īrent"
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

        # To choose, prefer
        MĀLŌ_MĀLLE_MĀLUĪ=<<EOJSON
        {
          "original string":"mālō mālle māluī",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "mālle",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "māluisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                    "mālam",
                    "mālēs",
                    "mālet",
                    "mālēmus",
                    "mālētis",
                    "mālent"
                  ]
                },
              "active_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "māluerō",
                    "mālueris",
                    "māluerit",
                    "māluerimus",
                    "mālueritis",
                    "māluerint"
                  ]
                },
              "active_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "mālēbam",
                    "mālēbās",
                    "mālēbat",
                    "mālēbāmus",
                    "mālēbātis",
                    "mālēbant"
                  ]
                },
              "active_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "mālueram",
                    "māluerās",
                    "māluerat",
                    "māluerāmus",
                    "māluerātis",
                    "māluerant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "māluī",
                    "māluistī",
                    "māluit",
                    "māluimus",
                    "māluistis",
                    "māluērunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "mālō",
                    "māvīs",
                    "māvult",
                    "mālumus",
                    "māvultis",
                    "mālunt"
                  ]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "māllem",
                    "māllēs",
                    "māllet",
                    "māllēmus",
                    "māllētis",
                    "māllent"
                  ]
                },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "māluissem",
                    "māluissēs",
                    "māluisset",
                    "māluissēmus",
                    "māluissētis",
                    "māluissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "māluerim",
                    "mālueris",
                    "māluerit",
                    "māluerimus",
                    "mālueritis",
                    "māluerint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "mālim",
                    "mālis",
                    "mālit",
                    "mālimus",
                    "mālitis",
                    "mālint"
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"volēns, volentis",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "velle",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "voluisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"dāns, dantis",
              "future_active_participle":"datūrus (-a, -um)",
              "perfect_passive_participle":"datus (-a, -um)",
              "future_passive_participle":"dandus (-a, -um)"
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "dāre",
              "present_passive_infinitive": "dārī",

              "perfect_active_infinitive": "dedisse",
              "perfect_passive_infinitive": "datum",

              "future_active_infinitive": "datūrum esse",
              "future_passive_infinitive": ""
            }
          },
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"edēns, edentis",
              "future_active_participle":"ēsūrus (-a, -um)",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "ēsse",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "ēdisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "ēsūrum esse",
              "future_passive_infinitive": ""
            }
          },
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
                  "ēderimus",
                  "ēderiits",
                  "ēderint"
                ]
              },
            "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "edēbam",
                  "edēbās",
                  "edēbat",
                  "edēbāmus",
                  "edēbātis",
                  "edēbant"
                ]
              },
            "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēderam",
                  "ēderās",
                  "ēderat",
                  "ēderāmus",
                  "ēderātis",
                  "ēderant"
                ]
              },
            "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "ēdī",
                  "ēdistī",
                  "ēdit",
                  "ēdimus",
                  "ēdistis",
                  "ēdērunt"
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"quiēns",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "quīre",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "quīsse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                  "quīvī",
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
                  "",
                  "queant"
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
                "data": [] }
          }
        }
EOJSON

# NEQUEŌ: to be able

        NEQUEŌ_NEQUĪRE_NEQUĪVĪ=<<EOJSON
        {
          "original string":"nequeō nequīre qneuivī ",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"nequiēns, nequientis",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "nequīre",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "nequīvisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                  "quīvī",
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
                  "",
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"faciēns, facientis",
              "future_active_participle":"factūrus",
              "perfect_passive_participle":"factus",
              "future_passive_participle":"faciendus"
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "facere",
              "present_passive_infinitive": "fierī",

              "perfect_active_infinitive": "fēcisse",
              "perfect_passive_infinitive": "factus esse",

              "future_active_infinitive": "factūrum esse",
              "future_passive_infinitive": ""
            }
          },
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
                  "fīs",
                  "fit",
                  "fīmus",
                  "fītis",
                  "fiunt"]
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
                  "factum sīs",
                  "factum sit",
                  "factum sīmus",
                  "factum sītis",
                  "factum sint"]
              },
            "passive_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "fīam",
                  "fīās",
                  "fīat",
                  "fīāmus",
                  "fīātis",
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
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"prōfutūrus",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "prōdesse",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "prōfuisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "prōfutūrum esse",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
            "active_voice_imperative_mood_present_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "prōdēs",
                [],
                [],
                "prōdeste",
                []
               ]
             },
            "active_voice_imperative_mood_future_tense": {
              "json_class": "Linguistics::Latin::Verb::TenseBlock",
              "data": [
                [],
                "prōdestō",
                [],
                [],
                "prōdestōte",
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
                  "prōfuerō",
                  "prōfueris",
                  "prōfuerit",
                  "prōfuerimus",
                  "prōfueritis",
                  "prōfuerint"
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
                  "prōdēs",
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

# A famous one, to be able
        POSSUM_POSSE_POTUĪ=<<EOJSON
        {
          "original string":"possum posse potuī",
            "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
            "participles":{
              "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
              "data": {
                "present_active_participle":"potēns, potentis",
                "future_active_participle":"",
                "perfect_passive_participle":"",
                "future_passive_participle":""
              }
            },
            "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "posse",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "potuisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                  "poterō",
                  "poteris",
                  "poterit",
                  "poterimus",
                  "poteritis",
                  "poterunt"
                  ]
              },
              "active_voice_indicative_mood_futureperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "potuerō",
                  "potueris",
                  "potuerit",
                  "potuerimus",
                  "potueritis",
                  "potuerint"
                  ]
              },
              "active_voice_indicative_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "poteram",
                  "poterās",
                  "poterat",
                  "poterāmus",
                  "poterātis",
                  "poterant"
                  ]
              },
              "active_voice_indicative_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "potueram",
                  "potuerās",
                  "potuerat",
                  "potuerāmus",
                  "potuerātis",
                  "potuerant"
                  ]
              },
              "active_voice_indicative_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "potuī",
                  "potuistī",
                  "potuit",
                  "potuimus",
                  "potuistis",
                  "potuērunt (-ēre)"
                  ]
              },
              "active_voice_indicative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "possum",
                  "potes",
                  "potest",
                  "possumus",
                  "potestis",
                  "possunt"
                  ]
              },
              "active_voice_subjunctive_mood_imperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "possem",
                  "possēs",
                  "posset",
                  "possēmus",
                  "possētis",
                  "possent"
                  ]
              },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "potuissem",
                  "potuissēs",
                  "potuisset",
                  "potuissēmus",
                  "potuissētis",
                  "potuissent"
                  ]
              },
              "active_voice_subjunctive_mood_perfect_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "potuerim",
                  "potueris",
                  "potuerit",
                  "potuerimus",
                  "potueritis",
                  "potuerint"
                  ]
              },
              "active_voice_subjunctive_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "possim",
                  "possīs",
                  "possit",
                  "possīmus",
                  "possītis",
                  "possint"
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
        NŌLŌ_NŌLLE_NŌLUĪ=<<EOJSON
        {
          "original string":"nōlō nōlle nōluī",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"nōlēns, nōlentis",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "nōlle",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "nōluisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                    "nōlō",
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

        COEPĪ_COEPISSE_COEPTUM=<<EOJSON
        {
          "original string":"coepī copeisse copetum",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{

            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"coeptūrus",
              "perfect_passive_participle":"coeptus",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "coepisse",
              "perfect_passive_infinitive": "coeptus",

              "future_active_infinitive": "coeptūrus",
              "future_passive_infinitive": ""
            }
          },
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
                  "data": []
                },
              "active_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeperō",
                    "coeperis",
                    "coeperit",
                    "coeperimus",
                    "coeperitis",
                    "coeperint"
                  ]
                },
              "active_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeperam",
                    "coeperās",
                    "coeperat",
                    "coeperāmus",
                    "coeperātis",
                    "coeperant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coepī",
                    "coepistī",
                    "coepit",
                    "coepimus",
                    "coepistis",
                    "coepērunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coepissem",
                    "coepissēs",
                    "coepisset",
                    "coepissēmus",
                    "coepissētis",
                    "coepissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeperim",
                    "coeperis",
                    "coeperit",
                    "coeperimus",
                    "coeperitis",
                    "coeperint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeptus erō",
                    "coeptus eris",
                    "coeptus erit",
                    "coeptus erimus",
                    "coeptus eritis",
                    "coeptus erunt"
                  ]
                },
              "passive_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "passive_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeptus eram",
                    "coeptus erās",
                    "coeptus erat",
                    "coeptus erāmus",
                    "coeptus erātis",
                    "coeptus erant"
                  ]
                },
              "passive_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeptus sum",
                    "coeptus es",
                    "coeptus est",
                    "coeptus sumus",
                    "coeptus estis",
                    "coeptus sunt"
                  ]
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
                  "data": [
                    "coeptus essem",
                    "coeptus essēs",
                    "coeptus esset",
                    "coeptus essēmus",
                    "coeptus essētis",
                    "coeptus essent"
                  ]
                },
              "passive_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "coeptus sim",
                    "coeptus sīs",
                    "coeptus sit",
                    "coeptus sīmus",
                    "coeptus sītis",
                    "coeptus sint"
                  ]
                },
              "passive_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                }
            }
          }
EOJSON
        ODĪ_ŌDISSE=<<EOJSON
        {
          "original string":"ōdī_ōdisse",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "ōdisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
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
                    "ōderō",
                    "ōderis",
                    "ōderit",
                    "ōderimus",
                    "ōderitis",
                    "ōderint"
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
                    "ōderam",
                    "ōderās",
                    "ōderat",
                    "ōderāmus",
                    "ōderātis",
                    "ōderant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "ōdī",
                    "ōdistī",
                    "ōdit",
                    "ōdimus",
                    "ōdistis",
                    "ōdērunt"
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
                    "ōdissem",
                    "ōdissēs",
                    "ōdisset",
                    "ōdissēmus",
                    "ōdissētis",
                    "ōdissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "ōderim",
                    "ōderis",
                    "ōderit",
                    "ōderimus",
                    "ōderitis",
                    "ōderint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
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


# To remember

        MEMINĪ_MEMINISSE=<<EOJSON
        {
          "original string":"meminī meminisse",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "meminisse",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  [],
                  "mementō",
                  [],
                  [],
                  "mementōte",
                  []
                 ]
               },
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
                  "data": []
                },
              "active_voice_indicative_mood_futureperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "meminerō",
                    "memineris",
                    "meminerit",
                    "meminerimus",
                    "memineritis",
                    "meminerint"
                  ]
                },
              "active_voice_indicative_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_indicative_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "memineram",
                    "meminerās",
                    "meminerat",
                    "meminerāmus",
                    "meminerātis",
                    "meminerant"
                  ]
                },
              "active_voice_indicative_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "meminī",
                    "meministī",
                    "meminit",
                    "meminimus",
                    "meministis",
                    "meminērunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
                },
              "active_voice_subjunctive_mood_pastperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "meminissem",
                    "meminissēs",
                    "meminisset",
                    "meminissēmus",
                    "meminissētis",
                    "meminissent"
                  ]
                },
              "active_voice_subjunctive_mood_perfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "meminerim",
                    "memineris",
                    "meminerit",
                    "meminerimus",
                    "memineritis",
                    "meminerint"
                  ]
                },
              "active_voice_subjunctive_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
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

# "I say"
# A&G206,a

        AIŌ=<<EOJSON
        {
          "original string":"aiō",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"aiēns",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_future_tense": {
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
              "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  [],
                  "aī",
                  [],
                  [],
                  "",
                  []
                 ]
               },
              "active_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
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
                    "aiēbam",
                    "aiēbās",
                    "aiēbat",
                    "aiēbāmus",
                    "aiēbātis",
                    "aiēbant"
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
                    ""
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "aiō",
                    "ais",
                    "ait",
                    "",
                    "",
                    "aiunt"]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
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
                    "aiās",
                    "aiat",
                    "",
                    "",
                    "aiant"
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

# Inquam
# I say
        INQUAM=<<EOJSON
        {
          "original string":"inquam",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_future_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  [],
                  "inquitō",
                  [],
                  [],
                  "",
                  []
                 ]
               },
              "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  [],
                  "inque",
                  [],
                  [],
                  "",
                  []
                 ]
               },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "inquam",
                    "inquis",
                    "inquit",
                    "inquimus",
                    "inquitis",
                    "inquiunt"
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
                    "inquiēbat",
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
                    "inquiī",
                    "inquīstī",
                    "",
                    "",
                    "",
                    ""
                  ]
                },
              "active_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "",
                    "inquiēs",
                    "inquiet",
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
                    "inquiēbat",
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
                    ""
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


EOJSON

# For/fari: To speak, pronounce
#
        FOR_FĀRĪ=<<EOJSON
        {
          "original string":"for fārī",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"fāns, fantis",
              "future_active_participle":"",
              "perfect_passive_participle":"fātus",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "fārī",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_present_tense": {
                "json_class": "Linguistics::Latin::Verb::TenseBlock",
                "data": [
                  "",
                  ""
                  "fāre",
                  ""
                  ""
                  ""]
                },
              "active_voice_indicative_mood_future_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "fābor",
                    "",
                    "fābitur",
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
                    "fātus eram",
                    "",
                    "fātus erat",
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
                    "fātus est",
                    "",
                    "",
                    "fātus sunt"
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "",
                    "",
                    "fātur",
                    "",
                    "",
                    "fantur"
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
                    ""
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

#  Quaesō:  To beg, request
        QUAESŌ=<<EOJSON
        {
          "original string":"quaesō",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"",
              "future_active_participle":"",
              "perfect_passive_participle":"",
              "future_passive_participle":""
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_future_tense": {
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
                  "data": []
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
                  "data": []
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
                    ""
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "quaesō",
                    "",
                    "",
                    "quaesumus",
                    "",
                    ""]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": []
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
                  "data": []
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

        OVĀRE=<<EOJSON
        {
          "original string":"ovāre",
          "classification": "Linguistics::Latin::Verb::VerbTypes::Irregular",
          "participles":{
            "json_class": "Linguistics::Latin::Verb::ParticipleBlock",
            "data": {
              "present_active_participle":"ovāns, ovantis",
              "future_active_participle":"ovātūrus",
              "perfect_passive_participle":"",
              "future_passive_participle":"ovandum"
            }
          },
          "infinitives":{
            "json_class": "Linguistics::Latin::Verb::InfinitiveBlock",
            "data": {
              "present_active_infinitive": "",
              "present_passive_infinitive": "",

              "perfect_active_infinitive": "",
              "perfect_passive_infinitive": "",

              "future_active_infinitive": "",
              "future_passive_infinitive": ""
            }
          },
          "tense_blocks": {
              "active_voice_imperative_mood_future_tense": {
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
                  "data": []
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
                  "data": []
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
                    ""
                  ]
                },
              "active_voice_indicative_mood_present_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "",
                    "ovās",
                    "ovāt",
                    "",
                    "",
                    ""]
                },
              "active_voice_subjunctive_mood_imperfect_tense": {
                  "json_class": "Linguistics::Latin::Verb::TenseBlock",
                  "data": [
                    "",
                    "",
                    "ovaret",
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
                    "ovet",
                    "",
                    "",
                    ""
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
