require_relative 'rental'
require_relative 'person_manager'
require_relative 'book_manager'
require_relative 'person'
require_relative 'book'

class RentalManager
  def initialize(person_manager, book_manager)
    @rentals = []
    @people = person_manager
    @books = book_manager
  end

  def create_rental_with_input(book_manager, person_manager)
    puts 'Available Books:'
    book_manager.list_all_books_index

    print 'Enter the index of the book you want to rent: '
    book_index = gets.chomp.to_i

    puts 'Available People:'
    person_manager.list_all_people_index

    print 'Enter the index of the person who wants to rent the book: '
    person_index = gets.chomp.to_i

    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp

    book = book_manager.get_book_by_index(book_index)
    person = person_manager.get_person_by_index(person_index)
    create_rental(book, person, date)
  end


  def create_rental(book, person, date)
    if book && person
      rental = Rental.new(book, person, date)
      book.add_rental(rental)
      person.add_rental(rental)
      @rentals.push(rental)
      puts "Rental created: Book Title: #{book.title}, Person Name: #{person.name}, Date: #{date}"
    else
      puts 'Invalid book or person!'
    end
    
  end

  def list_rentals_for_person(person_manager)
    print 'Enter the ID of the person: '
    id = gets.chomp.to_i
    person_manager.list_rentals_for_person_id(id)
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'No rentals found.'
    else
      puts 'List of Rentals:'
      @rentals.each do |rental|
        puts "Book: #{rental.book.title}, Person: #{rental.person.name}, Date: #{rental.date}"
      end
    end
  end

  def write_rentals_json
    rental_data = @rentals.map(&:to_hash)
    File.open('rental.json', 'w') do |f|
      f.write(JSON.pretty_generate(rental_data))
    end
  end

  def load_rentals_data
    rental_data = JSON.parse(File.read('rental.json'))
    rental_data.each do |rental_hash|
      book_title = rental_hash['book']
      person_name = rental_hash['person']
      rental_date = rental_hash['date']

      book = @books.get_book_by_title(book_title)
      person = @people.get_person_by_name(person_name)

      if book && person
        rental = Rental.new(book, person, rental_date)
        book.add_rental(rental)
        person.add_rental(rental)
        @rentals.push(rental)
      else
        puts 'Invalid book or person!'
      end
    end
  end
  
 
end