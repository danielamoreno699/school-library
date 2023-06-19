require_relative 'class_person'

class Teacher < Person
  def initialize(specialization, id, age, name = 'Unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
