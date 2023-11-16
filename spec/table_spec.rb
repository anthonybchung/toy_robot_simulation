# frozen_string_literal: true

require './table'
require './robot'
require './crane'

# Table should just validate the position entered.
# It does nothing more.

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
    Position = Struct.new(:x_pos, :y_pos)
    position = Position.new(1, 2)
    table = Table.new
    valid_position = table.validate_position(position)
    expect(valid_position).to be true
  end

  it 'should return false if the position is not valid' do
    position = Position.new(6, 6)
    table = Table.new
    valid_position = table.validate_position(position)
    expect(valid_position).to be false
  end

  it 'should return true if the position is 0,0 or 5,5' do
    position = Position.new(5, 5)
    table = Table.new
    valid_position = table.validate_position(position)
    expect(valid_position).to be true
    position.x_pos = 0
    position.y_pos = 0
    valid_position = table.validate_position(position)
    expect(valid_position).to be true
  end
end
