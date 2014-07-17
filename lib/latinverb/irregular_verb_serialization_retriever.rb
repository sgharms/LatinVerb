#encoding: UTF-8

module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class IrregularVerbSerializationRetriever
          MAPPING = {
            "aiō" => Linguistics::Latin::Verb::AIŌ,
            "coepī coepisse coeptum" => Linguistics::Latin::Verb::COEPĪ_COEPISSE_COEPTUM,
            "dō dāre dedī datum" => Linguistics::Latin::Verb::DŌ_DĀRE_DEDĪ_DATUM,
            "edō ēsse ēdī ēsum" => Linguistics::Latin::Verb::EDŌ_ĒSSE_ĒDĪ_ĒSUM,
            "eō īre ivī itum" => Linguistics::Latin::Verb::EŌ_ĪRE_IVĪ_ITUM,
            "ferō ferre tulī lātum" => Linguistics::Latin::Verb::FERŌ_FERRE_TULĪ_LĀTUM,
            "fiō fiērī factus" => Linguistics::Latin::Verb::FIŌ_FIĒRĪ_FACTUS,
            "mālō mālle māluī" => Linguistics::Latin::Verb::MĀLŌ_MĀLLE_MĀLUĪ,
            "meminī meminisse" => Linguistics::Latin::Verb::MEMINĪ_MEMINISSE,
            "nōlō nōlle nōluī" => Linguistics::Latin::Verb::NŌLŌ_NŌLLE_NŌLUĪ,
            "ōdī ōdisse" => Linguistics::Latin::Verb::ODĪ_ŌDISSE,
            "ovāre" => Linguistics::Latin::Verb::OVĀRE,
            "possum posse potuī" => Linguistics::Latin::Verb::POSSUM_POSSE_POTUĪ,
            "prōsum prōdesse prōfuī prōfutūrus" => Linguistics::Latin::Verb::PRŌSUM_PRŌDESSE_PRŌFUĪ_PRŌFUTŪRUS,
            "quaesō" => Linguistics::Latin::Verb::QUAESŌ,
            "queō quīre quīvī" => Linguistics::Latin::Verb::QUEŌ_QUĪRE_QUĪVĪ,
            "sum esse fuī futūrus" => Linguistics::Latin::Verb::SUM_ESSE_FUĪ_FUTŪRUS,
            "volō velle voluī" => Linguistics::Latin::Verb::VOLŌ_VELLE_VOLUĪ,
          }

          def initialize(lookup_string)
            @lookup_string = lookup_string
          end

          def serialized_verb
            MAPPING[@lookup_string]
          end
        end
      end
    end
  end
end
