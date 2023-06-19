class Person
    def initialize(id, name = "Unknown", age, parent_permission = true)
      @id = id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    # accessor get method
    attr_reader :id, :name, :age
  
    # accessor set method
    attr_writer :name, :age
  
    def of_age?
      if @age >= 18
        return true
      else
        return false
      end
    end
  
    #public method
    def can_use_services
      if of_age? || @parent_permission
        return true
      else
        return false
      end
    end
  end
  