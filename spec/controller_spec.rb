# frozen_string_literal: true

require './robot'
require './table'
require './controller'

describe Controller do
  it 'is created' do
  end

  it 'should be initialized with a table' do
    table = Table.new
    controller = Controller.new(table)

    expect(controller.table).to have_attributes(
      width: eq(5),
      length: eq(5)
    )
  end

  it 'should have instruction method' do
    table = Table.new
    controller = Controller.new(table)
    instruc_array = ['PLACE', 3, 2]
    controller.instruction(instruc_array)
  end

  it 'instruc_array first element PLACE should place the robot onto the board.' do
    table = Table.new
    controller = Controller.new(table)
    instruc_array = ['PLACE', 3, 2, 'SOUTH']
    controller.instruction(instruc_array)
    expect(controller.robot).to have_attributes(
      x_pos: eq(instruc_array[1]),
      y_pos: eq(instruc_array[2]),
      face: eq(instruc_array[3])
    )
  end

  it 'robot new position should be nil if position is out of bound' do
    table = Table.new
    controller = Controller.new(table)

    valid_array = ['PLACE', 3, 3, 'SOUTH']
    controller.instruction(valid_array)

    instruc_array = ['PLACE', 7, 0, 'SOUTH']

    controller.instruction(instruc_array)
    expect(controller.robot).to have_attributes(
      x_pos: eq(nil),
      y_pos: eq(nil),
      face: eq(nil)
    )
  end

  it 'MOVE should make the robot advance 1 position' do
    table = Table.new
    controller = Controller.new(table)

    # NORTH
    valid_array = ['PLACE', 3, 3, 'NORTH']
    controller.instruction(valid_array)

    move_array = ['MOVE']
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(3),
      y_pos: eq(4),
      face: eq('NORTH')
    )

    # EAST
    place_array = ['PLACE', 3, 3, 'EAST']
    controller.instruction(place_array)
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(4),
      y_pos: eq(3),
      face: eq('EAST')
    )

    # SOUTH
    place_array = ['PLACE', 0,5, 'SOUTH']
    controller.instruction(place_array)
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(0),
      y_pos: eq(4),
      face: eq('SOUTH')
    )


    # WEST
    place_array = ['PLACE', 5,5,'WEST']
    controller.instruction(place_array)
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(4),
      y_pos: eq(5),
      face: eq('WEST')
    )
  end

  it 'MOVE should not have any effect because of table limit' do
    table = Table.new
    controller = Controller.new(table)

    # NORTH
    valid_array = ['PLACE', 3, 5, 'NORTH']
    controller.instruction(valid_array)

    move_array = ['MOVE']
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(3),
      y_pos: eq(5),
      face: eq('NORTH')
    )

    # EAST
    east_array = ['PLACE', 5, 3, 'EAST']
    controller.instruction(east_array)

    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(5),
      y_pos: eq(3),
      face: eq('EAST')
    )

    # SOUTH
    south_array = ['PLACE', 0, 0, 'SOUTH']
    controller.instruction(south_array)
    controller.instruction(move_array)

    expect(controller.robot).to have_attributes(
      x_pos: eq(0),
      y_pos: eq(0),
      face: eq('SOUTH')
    )
  end

  it 'has a right method' do
    table = Table.new
    controller = Controller.new(table)
    place_array = ['PLACE', 0,0,'NORTH']
    controller.instruction(place_array)
    right_array = ['RIGHT']
    controller.instruction(right_array)
  end

  it 'should have the next right direction' do
    table = Table.new
    controller = Controller.new(table)
    right_array = ['RIGHT']
    place_array = ['PLACE', 0,0,'NORTH']
    controller.instruction(place_array)
    controller.instruction(right_array)

    expect(controller.robot.face).to eq('EAST')
    controller.instruction(right_array)
    expect(controller.robot.face).to eq('SOUTH')
    controller.instruction(right_array)
    expect(controller.robot.face).to eq('WEST')
    controller.instruction(right_array)
    expect(controller.robot.face).to eq('NORTH')
  end

  it 'should have the left method' do
    table = Table.new
    controller = Controller.new(table)
    place_array = ['PLACE', 0, 0, 'NORTH']
    controller.instruction(place_array)
    left_array = ['LEFT']
    controller.instruction(left_array)
  end

  it 'should have the next left direction/face' do
    table = Table.new
    controller = Controller.new(table)
    place_array = ['PLACE', 0, 0, 'NORTH']
    controller.instruction(place_array)

    left_array = ['LEFT']
    controller.instruction(left_array)
    expect(controller.robot.face).to eq('WEST')

    controller.instruction(left_array)
    expect(controller.robot.face).to eq('SOUTH')

    controller.instruction(left_array)
    expect(controller.robot.face).to eq('EAST')

    controller.instruction(left_array)
    expect(controller.robot.face).to eq('NORTH')
  end

  it 'REPORT should return the position of the robot' do
    table = Table.new
    controller = Controller.new(table)
    place_array = ['PLACE', 0, 0, 'NORTH']
    controller.instruction(place_array)

    right_array = ['RIGHT']
    controller.instruction(right_array)

    move_array = ['MOVE']
    controller.instruction(move_array)
    controller.instruction(move_array)

    left_array = ['LEFT']
    controller.instruction(left_array)

    report_array = ['REPORT']
    report = controller.instruction(report_array)

    expect(report).to eq('2,0,NORTH')
  end

  it 'LEFT, RIGHT, MOVE, REPORT should not work if robot does not have a valid position' do
    table = Table.new
    controller = Controller.new(table)
    move_array = ['MOVE']
    report = controller.instruction(move_array)
    expect(report).to eq('Robot is not on the board')
  end
end
