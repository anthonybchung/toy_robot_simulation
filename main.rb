require_relative 'robot.rb'
require_relative 'table.rb'
require_relative 'controller.rb'
require_relative 'interpretor.rb'

puts 'hello'
puts 'Enter you file'
file_name = gets.chomp

interpretor = Interpretor.new

interpretor.input_file(file_name)
instruction_array = interpretor.file_data

table = Table.new
controller = Controller.new(table)
result = nil
instruction_array.each do |row|
  result = controller.instruction(row)
end

puts result