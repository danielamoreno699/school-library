require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  # attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    return true if @age >= 18

    false
  end
  private :of_age?

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  # method that returns name
  def correct_name?
    @name
  end

  def add_person_to_rentals(person)
    @rentals.push(person)
    person.rentals = self
  end
end
