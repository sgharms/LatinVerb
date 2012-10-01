# encoding:  UTF-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        # :stopdoc:
        # active_present_endings: ("ap_"-prefixed)
          AP_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS = %w(s  t  mus  tis  nt)
          AP_THIRD_CONJUG_PERS_ENDINGS            = %w(ō  is it   imus itis unt)
          AP_THIRDIO_CONJG_PERS_ENDINGS           = %w(is it imus itis iunt)

        # active_imperfect_endings: ("ai_"-prefixed)
          AI_FIRST_AND_SECOND_CONJUG_PERS_ENDINGS = %w(bam bās bat bāmus bātis bant)
          AI_THIRD_CONJUG_PERS_ENDINGS            = %w(ēbam ēbās ēbat ēbāmus ēbātis ēbant)

        # active_future_endings: ("af_"-prefixed)
          AF_ONE_TWO_ENDINGS = %w(bō bis bit bimus bitis bunt)
          AF_OTHER_ENDINGS   = %w(am ēs et ēmus ētis ent)

        # active_perfect_present: ("aperf"-prefixed)
          APERF_ENDINGS        = %w(istī it imus istis ērunt)
          APERF_PAST_ENDINGS   = PLUPERF_ENDINGS  =
                                 %w(eram erās erat erāmus erātis erant)
          APERF_FUTURE_ENDINGS = %w(erō eris erit erimus eritis erint)

        # passive endings
          PASSIVE_ENDINGS_FIRST_AND_SECOND_CONJG =
            %w(r ris tur mur minī ntur)
          PASSIVE_ENDINGS_OTHER                  =
            %w(r eris itur imur iminī untur)

          PASS_PERF_PRESENT_ENDINGS = %w(sum es est sumus estis sunt)
          PASS_PERF_PAST_ENDINGS    = %w(eram erās erat erāmus erātis erant)
          PASS_PERF_FUTURE_ENDINGS  = %w(erō eris erit erimus eritis erint)

          PASS_PERF_SUBJUNCTIVE_ENDINGS = %w(sim sis sit simus sitis sint)
          PASS_PLUPERF_PAST_ENDINGS     = %w(essem essēs esset essēmus essētis essent)

        # subjunctive tools
          # hash for getting a verb's subjunctive stem
          # based off the W[e] F[ea]r [A] L[ia]r mnemonic
          ACTIVE_PRESENT_SUBJUNCTIVE_ENDINGS = {
            :First   => lambda  { |x| return x + "ē"  },
            :Second  => lambda  { |x| return x + "eā" },
            :Third   => lambda  { |x| return x + "ā"  },
            :Fourth  => lambda  { |x| return x + "iā" },
            :ThirdIO => lambda  { |x| return x + "iā" }
          }

        # Listing of all defective verbs
        # See A&G Sec. 205
        DEFECTIVE_VERBS = %w{
          addormisco
          adolesco
          aio
          albesco
          arboresco
          aresco
          assenesco
          auresco
          candesco
          canesco
          celebresco
          cornesco
          crudesco
          dulcesco
          effor
          erubesco
          extollo
          grandesco
          inquam
          languesco
          latesco
          longisco
          lucesco
          marcesco
          matresco
          mollesco
          remollesco
          siccesco
          sterto
          tenebresco
          tremesco
          tumesco
          veteresco
        }

        # Listing of all impersonal verbs
        # See A&G #207
        IMPERSONAL_VERBS = %w{
          accidit
          addecet
          advesperascit
          certum est
          condecet
          constat
          contingit
          cōnstat
          decet
          dedecet
          dēlecat
          evenit
          fit
          fulgerat
          grandinat
          ifvat
          interest
          licet
          lūcīscit hōc
          miseret
          necesse est
          ningit
          obtingit
          obvenit
          oportet
          paenitet
          piget
          placet
          pluit
          pluo
          praestat
          pudet
          restat
          rēfert
          rōrat
          superest
          taedet
          tonat
          vacat
          vesperāscit
          vidētur
          ēvenit
        }

        # Present system only.  See A&G206
        # There are probably more of these, but A&G only lists these two.
        PRESENT_ONLY = %w{
          maēre
          ferīre
          aiō
          inquam
          for
          quaesō
          ovāre
        }

        # See A&G # 192
        SEMI_DEPONENTS = {
          'audeō'  => %w(audēre ausus),
          'fidō'   => %w(fidere fīsus),
          'gaudeō' => %w(gaudēre gāvīsus),
          'soleō'  => %w(solēre solitus),
        }

        # Irregular Verbs.  See A&G 197
        IRREGULAR_VERBS = {
          'sum'    => 'SUM_ESSE_FUĪ_FUTŪRUS',
          'possum' => 'POSSUM_POSSE_POTUĪ',
          'ferō'   => 'FERŌ_FERRE_TULĪ_LĀTUM',
          'eō'     => 'EŌ_ĪRE_IVĪ_ITUM',
          'nōlō'   => 'NŌLŌ_NŌLLE_NŌLUĪ',
          'volō'   => 'VOLŌ_VELLE_VOLUĪ',
          'mālō'   => 'MĀLŌ_MĀLLE_MĀLUĪ',
          'dō'     => 'DŌ_DĀRE_DEDĪ_DATUM',
          'edō'    => 'EDŌ_ĒSSE_ĒDĪ_ĒSUM',
          'queō'   => 'QUEŌ_QUĪRE_QUĪVĪ',
          'fiō'    => 'FIŌ_FIĒRĪ_FACTUS',
          'prōsum' => 'PRŌSUM_PRŌDESSE_PRŌFUĪ_PRŌFUTŪRUS',
          'meminī' => 'MEMINĪ_MEMINISSE',
          'ōdī'    => 'ODĪ_ŌDISSE',
          'coepī'  => 'COEPĪ_COEPISSE_COEPTUM'
        }

        MEANINGS = {
          :active_voice_imperative_mood_future_tense => "Command that something be done in the future",
          :active_voice_indicative_mood_future_tense=> "Action to take place in the future: 'I will eat a hamburger.'" ,
          :active_voice_indicative_mood_futureperfect_tense => "Action to be completed in the future: 'I will have eaten a hamburger.'" ,
          :active_voice_indicative_mood_imperfect_tense => "Sustained, habitual action in the past:  'I was eating hamburgers daily when I was a freshman.'" ,
          :active_voice_indicative_mood_pastperfect_tense => "Action completed prior to a point in the past under discussion: 'I had eaten all the hamburgers (before my mother found out).'" ,
          :active_voice_indicative_mood_perfect_tense => "Action completed in the past: 'I ate a hamburger.'" ,
          :active_voice_indicative_mood_present_tense => "Present, possibly ongoing action relative to the speaker: 'I am eating a hamburger.  I eat a hamburger.'" ,
          :active_voice_subjunctive_mood_imperfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :active_voice_subjunctive_mood_pastperfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :active_voice_subjunctive_mood_perfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :active_voice_subjunctive_mood_present_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :passive_voice_indicative_mood_future_tense => "Action to be performed on conjugant in future:  'The hamburger will be eaten.'" ,
          :passive_voice_indicative_mood_futureperfect_tense => "Action is to be performed to completion on conjugant in future: 'The hamburger will have been eaten.'" ,
          :passive_voice_indicative_mood_imperfect_tense => "Habitual action performed on the conjugant in the past: 'The hamburger was being eaten slowly by the BurgerHoarder.'" ,
          :passive_voice_indicative_mood_pastperfect_tense => "Action was fully completed upon the conjugant at a time prior to a time in the past: 'The hamburger had been eaten before my mom came home.'" ,
          :passive_voice_indicative_mood_perfect_tense => "Action was completed upon the conjugant in the past: 'The hamburger was eaten.'" ,
          :passive_voice_indicative_mood_present_tense => "Conjugant is presently undergoing action in the present time: 'The hamburger is being eaten.'" ,
          :passive_voice_subjunctive_mood_imperfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :passive_voice_subjunctive_mood_pastperfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :passive_voice_subjunctive_mood_perfect_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc." ,
          :passive_voice_subjunctive_mood_present_tense => "Subjunctive uses apply: commands, contrary to fact wishes, etc."
        }
        # :startdoc:
      end
    end
  end
end
