# frozen_string_literal: true

# Table should tell the system if the robot is on/off the table, or return the position of the robot.
class Table
    attr_accessor :width, :length
    @@face_array = ["NORTH","EAST","SOUTH","WEST"]

    def initialize
        @width = 5
        @length = 5
    end

    def position(robot)
        result = false
        if (0..@width).include?(robot.x_pos) && (0..@length).include?(robot.y_pos) && @@face_array.include?(robot.face)
            result = true
        end
        return result
    end
end