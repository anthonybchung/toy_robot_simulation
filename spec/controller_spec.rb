# frozen_string_literal: true

require './controller'
require './robot'
require './table'

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
end
