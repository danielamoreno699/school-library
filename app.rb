require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    loop do
      display_menu
      choice = prompt_choice
      handle_choice(choice)
      break if choice == 7
    end
  end

  def display_menu
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'
  end

  def prompt_choice
    print 'Enter your choice (1-7): '
    gets.chomp.to_i
  end

  def handle_choice(choice)
    if OPTIONS.key?(choice)
      send(OPTIONS[choice])
      puts "\n"
    else
      invalid_choice
    end
  end

  def list_all_books
    if @books.empty?
      puts 'Empty list'
    else
      @books.each do |book|
        puts "Title: #{book.title} Author: #{book.author}"
      end
    end
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

  def create_book
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book created: Title: #{book.title}, Author: #{book.author}"
  end

  def create_rental
    print 'Enter the index of the book you want to rent: '
    book_index = gets.chomp.to_i
    print 'Enter the index of the person who wants to rent the book: '
    person_index = gets.chomp.to_i
    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp
    book = get_book_by_index(book_index)
    person = get_person_by_index(person_index)
    create_rental_instance(book, person, date)
  end

  def create_rental_instance(book, person, date)
    if book && person
      rental = Rental.new(book, person, date)
      book.add_rental(rental)
      person.add_rental(rental)
      puts "Rental created: Book Title: #{book.title}, Person Name: #{person.name}, Date: #{date}"
    else
      puts 'Invalid book or person!'
    end
  end

  def get_book_by_index(book_index)
    @books[book_index] if book_index >= 0 && book_index < @books.length
  end

  def get_person_by_index(person_index)
    @people[person_index] if person_index >= 0 && person_index < @people.length
  end

  def list_rentals_for_person
    print 'Enter the ID of the person: '
    id = gets.chomp.to_i
    list_rentals_for_person_id(id)
  end

  def list_rentals_for_person_id(id)
    found_person = @people.find { |p| p.id == id }

    if found_person
      rentals = found_person.rentals

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

  def exit_program
    puts 'Goodbye!'
  end

  def invalid_choice
    puts 'Invalid choice!'
  end
end
