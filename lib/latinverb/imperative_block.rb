#encoding: UTF-8
require_relative './imperative_block/imperative_rule_factory'

module Linguistics
  module Latin
    module Verb
      class ImperativeBlock
        extend Forwardable
        def_delegators :@results, :[], :to_a, :length

        include Linguistics::Latin::Phonographia
        def initialize(stem, plural_present_imperative, verb)
          @stem = stem
          @plural_present_imperative = plural_present_imperative
          @verb = verb

          if @verb.classification == Linguistics::Latin::Verb::Classification::Deponent
            @results = form_imperative_base_for_deponent
            add_additional_imperative_forms_for_deponent
          else
            @results = form_imperative_base
            add_additional_imperative_forms
          end

          @results.map{|v| fix_macrons v}
        end

        def form_imperative_base_for_deponent
          [@verb.stem, @verb.active_voice_indicative_mood_present_tense.plural_number_second_person, @verb.active_voice_indicative_mood_present_tense_third_person_singular_number.sub(/tur\z/, 'tor')]
        end

        def add_additional_imperative_forms_for_deponent
        end

        def present_tense_singular_number
          present('singular')
        end

        def present_tense_plural_number
          present('plural')
        end

        def future(qualifier=nil)
          return @results[2,4] if qualifier.nil?
        end

        def present(qualifier=nil)
          j = @results[0,2]
          return j if qualifier.nil?
          qualifier = qualifier.to_s
          return j[0] if qualifier =~ /singular/
          return j[1] if qualifier =~ /plural/
        end

        private

        def add_additional_imperative_forms
          stem = @stem || @verb.instance_variable_get(:@proxyVerb).stem
          @results << stem + "tō"
          @results << stem + "tōte"

          @results << stem + "tō"
          @results << stem + "ntō"
        end

        def form_imperative_base
          ImperativeRuleFactory.new(@verb).present_tense_rule.call(@stem, @plural_present_imperative)
        end
      end
    end
  end
end
