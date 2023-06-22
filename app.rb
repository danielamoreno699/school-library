require_relative 'person'
require_relative 'book'
require_relative 'rental'

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
            puts "Name: #{person.name} Age: #{person.age} Parent Permission: #{person.parent_permission}"
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
        puts "Person created: Name: #{person.name}, Age: #{person.age}"
    end

    def create_book(title, author)
        book = Book.new(title, author)
        @books.push(book)
        puts "Book created: Title: #{book.title}, Author: #{book.author}"
    end

end