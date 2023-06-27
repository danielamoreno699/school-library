class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom_student=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_hash
    {
      type: 'student',
      id: id,
      name: name,
      age: age,
      parent_permission: @parent_permission
    }
  end
end
