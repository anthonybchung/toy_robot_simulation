
require './table'
require './robot'
require './crane'

describe Table do
    it 'should be created' do
    end

    it 'should initialize with width 5 and length 5' do
        table = Table.new

        width = table.width
        length = table.length

        expect(width).to be 5
        expect(length).to be 5
    end

    it 'should return true if position is valid' do
        table = Table.new 
        robot = Robot.new
        robot.x_pos = 2
        robot.y_pos = 4
        robot.face = "NORTH"
        expect(table.position(robot)).to be true
    end

    it 'should return false if the position is not valid' do
        table = Table.new
        robot = Robot.new
        robot.x_pos = 3
        robot.y_pos = 6
        robot.face = "SOUTH"
        expect(table.position(robot)).to be false

    end
end