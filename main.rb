require_relative 'app'

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
  @app.run
end

main
