class Book

    attr_accessor :title, :author
    attr_reader :title, :author, :rentals

    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end
end