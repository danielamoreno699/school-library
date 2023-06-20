require './base_decorator'

class TrimmerDecorator < BaseDecorator
  # rubocop:disable Lint/UselessMethodDefinition
  def initialize(nameable)
    super(nameable)
  end
  # rubocop:enable Lint/UselessMethodDefinition

  def correct_name?
    name = @nameable.correct_name?
    name.length > 10 ? name.slice(0, 10) : name
  end
end
