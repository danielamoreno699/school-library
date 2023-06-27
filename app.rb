
require_relative 'rental'
require_relative 'rental_manager'
require_relative 'person_manager'
require_relative 'book_manager'

class App
  def initialize
    @person_manager = PersonManager.new
    @book_manager = BookManager.new
    @rental_manager = RentalManager.new
  end

  def list_all_books
    @book_manager.list_all_books
  end

  def list_all_people
    @person_manager.list_all_people
  end

  def create_person
    @person_manager.create_person
  end

  def create_book
    @book_manager.create_book
  end

  def create_rental
    puts 'Available Books:'
    @book_manager.list_all_books_index

    print 'Enter the index of the book you want to rent: '
    book_index = gets.chomp.to_i

    puts 'Available People:'
    @person_manager.list_all_people_index

    print 'Enter the index of the person who wants to rent the book: '
    person_index = gets.chomp.to_i

    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp
    book = @book_manager.get_book_by_index(book_index)
    person = @person_manager.get_person_by_index(person_index)
    @rental_manager.create_rental(book, person, date)

  end

  

  def list_rentals_for_person
    print 'Enter the ID of the person: '
    id = gets.chomp.to_i
    @person_manager.list_rentals_for_person_id(id)
  end
end
