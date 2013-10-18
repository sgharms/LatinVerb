class TenseMethodsVectorizer
  FINAL_VECTORS = {
    0 => [ :first_person_singular_number, :singular_number_first_person ],
    1 => [ :second_person_singular_number, :singular_number_second_person ],
    2 => [ :third_person_singular_number, :singular_number_third_person ],
    3 => [ :first_person_plural_number, :plural_number_first_person ],
    4 => [ :second_person_plural_number, :plural_number_second_person ],
    5 => [ :third_person_plural_number, :plural_number_third_person ]
  }

  def initialize(verb)
    @verb = verb
  end

  def add_vector_methods!
    add_by_person_and_number_methods!
    add_methods_for_aggregation_when_person_or_number_is_missing!
  end

  private
  def add_by_person_and_number_methods!
    locally_bound_verb = @verb
    verb_tense_methods.each do | tense_block_method |
      FINAL_VECTORS.each_pair do | tense_block_location, accessors |
        accessors.each do | accessor |
          new_method = [tense_block_method, accessor].map(&:to_s).join('_').to_sym
          @verb.singleton_class.instance_eval do
            define_method new_method, Proc.new{ locally_bound_verb.send(tense_block_method)[tense_block_location] }
          end
        end
      end
    end
  end

  def add_methods_for_aggregation_when_person_or_number_is_missing!
    verb_tense_methods.each do | tense_block_method |
      @verb.singleton_class.class_eval do
        define_method("#{tense_block_method}_first_person", Proc.new do
          [ self.send(tense_block_method)[0],
            self.send(tense_block_method)[3] ]
        end)

        define_method("#{tense_block_method}_second_person", Proc.new do
          [ self.send(tense_block_method)[1],
            self.send(tense_block_method)[4] ]
        end)

        define_method("#{tense_block_method}_third_person", Proc.new do
          [ self.send(tense_block_method)[2],
            self.send(tense_block_method)[5] ]
        end)

        define_method("#{tense_block_method}_singular_number", Proc.new do
          [ self.send(tense_block_method)[0],
            self.send(tense_block_method)[1],
            self.send(tense_block_method)[2] ]
        end)

        define_method("#{tense_block_method}_plural_number", Proc.new do
          [ self.send(tense_block_method)[3],
            self.send(tense_block_method)[4],
            self.send(tense_block_method)[5] ]
        end)
      end
    end
  end

  private

  def verb_tense_methods
    @verb.methods.grep(/tense\z/)
  end
end
