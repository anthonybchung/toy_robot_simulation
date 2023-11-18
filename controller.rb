# frozen_string_literal: true

# Controller should control the robot.
# PLACE, MOVE, turn LEFT, turn RIGHT
class Controller
  attr_accessor :table, :robot

  Position = Struct.new(:x_pos, :y_pos)
  @@direction = ["NORTH","EAST","SOUTH","WEST"]

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
    elsif instruc_array[0] == 'MOVE' && @robot.x_pos != nil
      move
    elsif instruc_array[0] == 'RIGHT' && @robot.x_pos != nil
      right
    elsif instruc_array[0] == 'LEFT' && @robot.x_pos != nil
      left
    elsif instruc_array[0] == 'REPORT' && @robot.x_pos != nil
      return report
    elsif @robot.x_pos == nil
      return 'Robot is not on the board'
    end

    @robot
  end

  private

  def place(x_pos:, y_pos:, face:)
    position = Position.new(x_pos, y_pos)
    validate_position = @table.validate_position(position)
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

  def move
    if @robot.face == 'NORTH'
      position_new = Position.new(@robot.x_pos, @robot.y_pos + 1)
      validate_position = @table.validate_position(position_new)
      @robot.y_pos += 1 if validate_position
    elsif @robot.face == 'EAST'
      position_new = Position.new(@robot.x_pos + 1, @robot.y_pos)
      validate_position = @table.validate_position(position_new)
      @robot.x_pos += 1 if validate_position
    elsif @robot.face == 'SOUTH'
      position_new = Position.new(@robot.x_pos,@robot.y_pos - 1)
      validate_position = @table.validate_position(position_new)
      @robot.y_pos -= 1 if validate_position
    elsif @robot.face == 'WEST'
      position_new = Position.new(@robot.x_pos - 1, @robot.y_pos)
      validate_position = @table.validate_position(position_new)
      @robot.x_pos -= 1 if validate_position
    end

    def right
      current_direction = @@direction.find_index(@robot.face)
      new_direction = current_direction + 1
      new_direction = 0 if new_direction > 3
      @robot.face = @@direction[new_direction]
    end

    def left
      current_direction = @@direction.find_index(@robot.face)
      new_direction = current_direction - 1
      new_direction = 3 if new_direction < 0
      @robot.face = @@direction[new_direction]
    end
  end

  def report
    report_str = "#{@robot.x_pos},#{@robot.y_pos},#{@robot.face}"
  end
end
