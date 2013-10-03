# encoding: UTF-8
module Linguistics
  module Latin
    module Verb
      module Classification
        class ClassificationType; end
        class Defective < ClassificationType; end
        class Deponent < ClassificationType; end
        class Impersonal < ClassificationType; end
        class Irregular < ClassificationType; end
        class PresentOnly < ClassificationType; end
        class Regular < ClassificationType; end
        class Semideponent < ClassificationType; end
      end

      module VerbTypes
        class VerbType; end
        class First < VerbType; end
        class Second < VerbType; end
        class Third < VerbType; end
        class ThirdIO < VerbType; end
        class Fourth < VerbType; end
        class Irregular < VerbType; end
      end
    end
  end
end

