class Book
  attr_accessor :title, :author, :rentals
  #attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_book_to_rentals(book)
    @rentals.push(book)
    book.rentals = self
  end
end
