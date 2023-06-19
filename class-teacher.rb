class Teacher < Person{
    def initialize(id, name = "Unknown", age, parent_permission = true, specialization)
        super(id, name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        return true
      end
}