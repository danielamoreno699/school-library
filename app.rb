require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
    def initialize
        @people = []
        @books = []
        @rentals = []
    end

    def list_all_books
        @books.each do |book|
            puts "Title: #{book.title} Author: #{book.author}"
        end
    end

    def list_all_people
        @people.each do |person|
            puts "Name: #{person.name} Age: #{person.age} Parent Permission: #{person.parent_permission}"
        end
    end

end