class QuerentTenseMethodsVectorizer
  FINAL_VECTORS = {
    0 => [ :first_person_singular_number, :singular_number_first_person ],
    1 => [ :second_person_singular_number, :singular_number_second_person ],
    2 => [ :third_person_singular_number, :singular_number_third_person ],
    3 => [ :first_person_plural_number, :plural_number_first_person ],
    4 => [ :second_person_plural_number, :plural_number_second_person ],
    5 => [ :third_person_plural_number, :plural_number_third_person ]
  }

  def initialize(tense_block_bearer)
    @tense_block_bearer = tense_block_bearer
  end

  def add_vector_methods!
    add_by_person_and_number_methods!
    add_methods_for_aggregation_when_person_or_number_is_missing!
    @tense_block_bearer
  end

  private

  def add_by_person_and_number_methods!
    locally_bound_tense_block_bearer = @tense_block_bearer
    verb_tense_methods.each do | tense_block_method |
      FINAL_VECTORS.each_pair do | tense_block_location, accessors |
        accessors.each do | accessor |
          new_method = [tense_block_method, accessor].map(&:to_s).join('_').to_sym
          @tense_block_bearer.singleton_class.instance_eval do
            define_method new_method, Proc.new{ locally_bound_tense_block_bearer.send(tense_block_method)[tense_block_location] }
          end
          type =  locally_bound_tense_block_bearer.class.to_s.split('::').last
          @tense_block_bearer.add_method(new_method)
        end
      end
    end
  end

  def add_methods_for_aggregation_when_person_or_number_is_missing!
    verb_tense_methods.each do | tense_block_method |
      @tense_block_bearer.singleton_class.class_eval do
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
      type = @tense_block_bearer.class.to_s.split('::').last
      [
        "#{tense_block_method}_first_person",
        "#{tense_block_method}_second_person",
        "#{tense_block_method}_third_person",
        "#{tense_block_method}_singular_number",
        "#{tense_block_method}_plural_number"
      ].each{|m| @tense_block_bearer.add_method(m.to_sym)} if !(type =~ /(Adapt|Irreg)/)
    end
  end

  private

  def verb_tense_methods
    @tense_block_bearer.tense_block_methods
  end
end

