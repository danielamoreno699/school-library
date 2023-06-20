require "./nameable.rb"


class Person < Nameable
  include Nameable
  # setters and getters
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
  def correct_name?(name)
    @name = name
  end

end
