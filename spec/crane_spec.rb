# frozen_string_literal: true

require './crane'

describe Crane do
  it 'should be created' do
    Crane.new
  end

  it 'place should return position of robot' do
    robot = Robot.new
    place = 'PLACE 3,3,NORTH'

    crane = Crane.new
    robot = crane.place(robot, place)

    expect(robot.x_pos).to be 3
    expect(robot.y_pos).to be 3
    expect(robot.face).to eq 'NORTH'
  end

  it 'should be attached to the table' do
    crane = Crane.new

    width = crane.table.width
    length = crane.table.length

    expect(width).to be 5
    expect(length).to be 5
  end
end
