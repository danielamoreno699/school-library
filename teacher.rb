class Teacher < Person
  attr_accessor :specialization

  def initialize(id, name, age, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      type: 'teacher',
      id: id,
      name: name,
      age: age,
      specialization: specialization
    }
  end
end
