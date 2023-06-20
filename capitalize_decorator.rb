require './base_decorator'

class CapitalizeDecorator < BaseDecorator
  # rubocop:disable Lint/UselessMethodDefinition
  def initialize(nameable)
    super(nameable)
  end
  # rubocop:enable Lint/UselessMethodDefinition

  def correct_name?
    @nameable.correct_name?.capitalize
  end
end
