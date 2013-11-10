module Linguistics
  module Latin
    module Verb
      class LatinVerb
        ::AFIRST = new('amō amāre amāvī amatum')
        ::ASECOND = LatinVerb.new('moneō monēre monuī monitum')
        ::ATHIRD = LatinVerb.new('agō agere ēgī actum')
        ::ATHIRDIO = LatinVerb.new('capiō capere cēpī captum')
        ::AFOURTH = LatinVerb.new('audiō audīre audīvī auditum')

        #::AFIRST_DEP =  LatinVerb.new('mīror mīrārī mīrātum')
        #::ASECOND_DEP =  LatinVerb.new('vereor verērī veritum')
        #::ATHIRD_DEP = LatinVerb.new('sequor sequī secūtum')
        #::ATHIRDIO_DEP = LatinVerb.new('patior patī passum')
        #::AFOURTH_DEP = LatinVerb.new('partior partīrī partītum')

        #::SUM = LatinVerb.new('sum esse fuī futūrus')
      end
    end
  end
end
