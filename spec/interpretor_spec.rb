require './interpretor'

describe Interpretor do
  it 'should be created' do
  end

  it 'should have a interpretor method' do
    interpretor = Interpretor.new
    str = 'robot_instruction.txt'
    interpretor.input_file(str)
  end

  it 'should have an attribute file_data containing an array of instructions' do
    interpretor = Interpretor.new
    str = 'robot_instruction.txt'
    interpretor.input_file(str)
    expect(interpretor.file_data).to be_an(Array)
  end

  it 'the attribut file array element should contain arrays for instruction.' do
    interpretor = Interpretor.new
    str = 'robot_instruction.txt'
    interpretor.input_file(str)
    expect(interpretor.file_data[0]).to be_an(Array)
  end
end