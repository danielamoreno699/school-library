require './app'

@app = App.new

OPTIONS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_for_person,
  7 => :exit_program
}.freeze

def main
  display_menu

  loop do
    choice = prompt_choice
    handle_choice(choice)
    break if choice == 7
  end
end

def display_menu
  puts 'Please select an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
end

def prompt_choice
  print 'Enter your choice (1-7): '
  gets.chomp.to_i
end

def handle_choice(choice)
  if OPTIONS.key?(choice)
    send(OPTIONS[choice])
  else
    invalid_choice
  end
end

def list_all_books
  @app.list_all_books
end

def list_all_people
  @app.list_all_people
end

def create_person
  print 'Enter the person name: '
  name = gets.chomp
  print 'Enter the person age: '
  age = gets.chomp.to_i
  print 'Enter the person type (student/teacher): '
  type = gets.chomp.downcase
  @app.create_person(name, age, type)
end

def create_book
  print 'Enter the book title: '
  title = gets.chomp
  print 'Enter the book author: '
  author = gets.chomp
  @app.create_book(title, author)
end

def create_rental
  print 'Enter the book title: '
  book_title = gets.chomp
  print 'Enter the person name: '
  person_name = gets.chomp
  print 'Enter the rental date (YYYY-MM-DD): '
  date = gets.chomp
  @app.create_rental(book_title, person_name, date)
end

def list_rentals_for_person
  print 'Enter the person ID: '
  id = gets.chomp.to_i
  @app.list_rentals_for_person_id(id)
end

def exit_program
  puts 'Thank you for using the Library Management System. Goodbye!'
end

def invalid_choice
  puts 'Invalid choice. Please try again.'
end

main
