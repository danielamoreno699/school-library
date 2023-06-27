require_relative 'rental'
require_relative 'person_manager'
require_relative 'book_manager'

class RentalManager
  def initialize
    @rentals = []
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

 
end