# frozen_string_literal: true

require './robot'

describe Robot do
  it 'should initialize with all attributes as nil' do
    robot = Robot.new
    robot.x_pos = nil
    robot.y_pos = nil
    robot.face = nil

    expect(robot.x_pos).to eq nil
    expect(robot.y_pos).to eq nil
    expect(robot.face).to eq nil
  end
end
