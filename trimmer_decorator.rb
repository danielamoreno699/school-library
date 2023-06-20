
require './base_decorator.rb'

class TrimmerDecorator < BaseDecorator
    def initialize(nameable)
        super(nameable)
       

    end

    def correct_name?
        name = @nameable.correct_name?
        name.length > 10 ? name.slice(0, 10) : name    
    end

end