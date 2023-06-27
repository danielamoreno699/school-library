require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class PersonManager
  def initialize
    @people = []
  end

  def get_person_by_index(person_index)
    @people[person_index] if person_index >= 0 && person_index < @people.length
  end

  def list_all_people
    if @people.empty?
      puts 'Empty list'
    else
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Person created: ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, " \
               "Permission: #{person.parent_permission}"
        elsif person.is_a?(Teacher)
          puts "[Teacher] Person created: ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, " \
               "specialization: #{person.specialization}"
        end
      end
    end
  end

  def list_all_people_index
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}"
    end
    puts "Length of people array: #{@people.length}"
  end

  def list_rentals_for_person_id(id)
    person = @people.find { |p| p.id == id }

    if person
      rentals = person.rentals

      if rentals.empty?
        puts "No rentals found for person with ID #{id}."
      else
        puts "Rentals for person with ID #{id}:"
        rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    else
      puts "Person with ID #{id} not found."
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [input the number]: '
    type_choice = gets.chomp.to_i

    case type_choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid person type choice!'
    end
  end




  private

  def create_student
    print 'Enter the student name: '
    name = gets.chomp
    print 'Enter the student age: '
    age = gets.chomp.to_i
    print 'Enter if the student has permission (y/n): '
    has_permission = gets.chomp.downcase == 'y'
    extra_info = { parent_permission: has_permission }
    create_person_instance(name, age, 'student', extra_info)
  end

  def create_teacher
    print 'Enter the teacher name: '
    name = gets.chomp
    print 'Enter the teacher age: '
    age = gets.chomp.to_i
    print 'Enter the teacher specialization: '
    specialization = gets.chomp
    extra_info = { specialization: specialization }
    create_person_instance(name, age, 'teacher', extra_info)
  end

  def create_person_instance(name, age, type, extra_info)
    if type == 'student'
      person = Student.new(name, age, parent_permission: extra_info[:parent_permission])
    elsif type == 'teacher'
      person = Teacher.new(name, age, extra_info[:specialization])
    else
      puts 'Invalid person type!'
      return
    end

    @people.push(person)
    puts "Person created: ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end

  
end
