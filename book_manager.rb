require_relative 'book'

class BookManager
  def initialize
    @books = []
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

  def list_all_books_index
    @books.each_with_index do |book, index|
      puts "#{index }) Title: #{book.title}, Author: #{book.author}"
    end
    puts "Length of books array: #{@books.length}"
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

  def get_book_by_index(book_index)
    @books[book_index] if book_index >= 0 && book_index < @books.length
  end
end