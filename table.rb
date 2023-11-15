# frozen_string_literal: true

# Table should just validate the entered position.
# It does nothing more.
class Table
  attr_accessor :width, :length

  def initialize
    @width = 5
    @length = 5
  end

  def validate_position(position)
    if position.x_pos.between?(0, @width) && position.y_pos.between?(0, @length)
      true
    else
      false
    end
  end
end
