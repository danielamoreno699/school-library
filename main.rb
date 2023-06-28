require_relative 'app'

@app = App.new

class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
   
    puts 'Welcome to the App Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'
    run_menu_loop
  end

  private

  def run_menu_loop
    loop do
      choice = prompt_choice
      handle_choice(choice)
      break if choice == 7
    end
  end

  def prompt_choice
    print 'Enter your choice (1-7): '
    gets.chomp.to_i
  end

  def handle_choice(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person
    when 7
      @app.exit_program
    else
      invalid_choice
    end
    puts "\n"
    display_menu
  end

  def invalid_choice
    puts 'Invalid choice!'
  end

end

def main
  menu = Menu.new(@app)
  menu.display_menu
end

main
