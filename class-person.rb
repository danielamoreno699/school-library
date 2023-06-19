class Person{
    def initialize(id, name? = "Unknown", age, parent_permission? = true)
        @id = id
        @name = name
        @age = age
        

    end

      # accessor get method
   attr_reader :id, :name, :age


 # accessor set method
 attr_writer :name, :age
end

def of_age?(@age)
    if @age >= 18
      return true
    else
      return false
    end
  end

def can_use_services
    if of_age?(@age) == true || @parent_permission == true
        return true
    else
        return false
    end
  

}