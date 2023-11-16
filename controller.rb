# frozen_string_literal: true

# Controller should control the robot.
# PLACE, MOVE, turn LEFT, turn RIGHT
class Controller
  attr_accessor :table, :robot

  Position = Struct.new(:x_pos, :y_pos)

  def initialize(table)
    @table = table
    @robot = Robot.new
  end

  def instruction(instruc_array)
    if instruc_array[0] == 'PLACE'
      x_pos = instruc_array[1]
      y_pos = instruc_array[2]
      face = instruc_array[3]
      place(x_pos:, y_pos:, face:)
    end

    @robot
  end

  private

  def place(x_pos:, y_pos:, face:)
    position = Position.new(x_pos, y_pos)
    validate_position = table.validate_position(position)
    if validate_position
      @robot.x_pos = x_pos
      @robot.y_pos = y_pos
      @robot.face = face
    else
      @robot.x_pos = nil
      @robot.y_pos = nil
      @robot.face = nil
    end
  end
end
