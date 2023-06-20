require './nameable'

class BaseDecorator < Nameable
  def correct_name?
    @nameable.correct_name?
  end
end
