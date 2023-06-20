require './nameable.rb'

class BaseDecorator < nameable 
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name?
        @nameable.correct_name?
    end

end