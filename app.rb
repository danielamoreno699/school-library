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

    def list_all_books
        @books.each do |book|
            puts "Title: #{book.title} Author: #{book.author}"
        end
    end

    def list_all_people
        @people.each do |person|
            puts " ID: #{person.id} Name: #{person.name} Age: #{person.age} Parent Permission: #{person.parent_permission}"
        end
    end

    def create_person(name, age, type)
        if type == 'student'
            person = Student.new(name, age)
        elsif type == 'teacher'
            person = Teacher.new(name, age)
        else
            puts 'Invalid person type!'
            return
        end

       
        @people.push(person)
        puts "Person created: ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    def create_book(title, author)
        book = Book.new(title, author)
        @books.push(book)
        puts "Book created: Title: #{book.title}, Author: #{book.author}"
    end

    def create_rental(book_title, person_name, date)
        book = _find_book_by_title(book_title)
        person = _find_person_by_name(person_name)
      
        if book && person && date != ''

        rental = Rental.new(book, person, date)
        book.add_rental(rental)
        person.add_rental(rental)
        
    puts "Rental created: Book Title: #{book.title}, Person Name: #{person.name},Date: #{date}"
          else
            puts 'Invalid book title or person name!'
          end
      end

    def _find_book_by_title(title)
      @books.find { |book| book.title == title }
    end

    def _find_person_by_name(name)
        @people.find { |person| person.name == name }
      end

      def list_rentals_for_person_id(id)
        person = @people.find { |person| person.id == id }
      
        if person
          rentals = person.rentals
      
          if rentals.empty?
            puts "No rentals found for person with ID #{id}."
          else
            puts "Rentals for person with ID #{id}:"
            rentals.each do |rental|
              puts "Date: #{rental.date}, Book: #{rental.book.title}"
            end
          end
        else
          puts "Person with ID #{id} not found."
        end
      end
      

end