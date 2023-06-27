require_relative 'rental'
require_relative 'rental_manager'
require_relative 'person_manager'
require_relative 'book_manager'

class App
  def initialize
    @person_manager = PersonManager.new
    @book_manager = BookManager.new
    @rental_manager = RentalManager.new(@person_manager, @book_manager)
    load_files_data
  end

  def load_files_data
    @book_manager.load_books_data
    list_all_books
    @person_manager.load_people_data
    list_all_people
    @rental_manager.load_rentals_data
    list_all_rentals
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
    @rental_manager.create_rental_with_input(@book_manager, @person_manager)
  end

  def list_rentals_for_person
    @rental_manager.list_rentals_for_person(@person_manager)
  end

  def list_all_rentals
    @rental_manager.list_all_rentals
  end

  def exit_program
    @rental_manager.write_rentals_json
    @person_manager.write_people_json
    @book_manager.write_books_json
    puts 'Goodbye!'
  end
end
