require './app'

@app = App.new 

def main
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'

    loop do
        print 'Enter your choice (1-7): '
        choice = gets.chomp.to_i
    
        case choice
        when 1
            @app.list_all_books
        when 2
            @app.list_all_people
        when 3
            print 'Enter the person name: '
            name = gets.chomp
            print 'Enter the person age: '
            age = gets.chomp.to_i
            print 'Enter the person type (student/teacher): '
            type = gets.chomp.downcase
            @app.create_person(name, age, type)
        when 4
            print 'Enter the book title: '
            title = gets.chomp
            print 'Enter the book author: '
            author = gets.chomp
            @app.create_book(title, author)
        when 5
            print 'Enter the book title: '
            book_title = gets.chomp
            print 'Enter the person name: '
            person_name = gets.chomp
            print 'Enter the rental date(YYYY-MM-DD): '
            date = gets.chomp
            @app.create_rental(book_title, person_name, date)
        when 6
            print 'Enter the person ID: '
            id = gets.chomp.to_i
            @app.list_rentals_for_person_id(id)
        when 7
          puts 'Thank you for using the Library Management System. Goodbye!'
          break
        else
          puts 'Invalid choice. Please try again.'
        end
      end

end

main()