# frozen_string_literal: true

class Table
    attr_accessor :width, :length

    def initialize
        @width = 5
        @length = 5
    end

    def validate_position(position)
        if (position.x_pos).between?(0,@width) and (position.y_pos).between?(0,@length)
            return true
        else
            return false
        end
    end

end