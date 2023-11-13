# frozen_string_literal: true

# Crane places a robot onto the table, and returns new robot position.
class Crane
    def initialize
        @table = Table.new
    end
    def place(robot,place_command)
        position_array = split_command(place_command)
        robot.x_pos = position_array[1].to_i
        robot.y_pos = position_array[2].to_i
        robot.face = position_array[3]
        return robot
    end

    private

    def split_command(place_command)
        position_array = place_command.split(/,|\s/)
        position_array
    end
end