require 'json'
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

  def write_books_json
       book_data = @books.map(&:to_hash)
      File.open('book.json', 'w') do |f|
      f.write(JSON.pretty_generate(book_data))
      end
  end

  def get_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def load_books_data
    if File.exist?('book.json')
      if File.zero?('book.json')
        puts 'The book.json file is empty.'
      else
        book_data = JSON.parse(File.read('book.json'))
        book_data.each do |book|
          @books << Book.new(book['title'], book['author'])
        end
      end
    else
      puts 'The book.json file does not exist.'
    end
  end
end