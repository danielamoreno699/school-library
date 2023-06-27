class Rental
  attr_accessor :date, :book, :person

  # attr_reader :book, :person

  def initialize(book, person, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_hash
    {
      book: book.title,
      person: person.name,
      date: date.to_s
    }
  end
end
