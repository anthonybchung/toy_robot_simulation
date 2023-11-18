class Interpretor
  attr_reader :file_data

  def initialize
    @file_data = []
  end

  def input_file(file)
    file_raw = File.open(file,'r')
    @file_data.clear
    file_raw.each_line do |line|
      one_line = line.chomp
      instruct_array = one_line.split(/[,\s]+/)
      @file_data << instruct_array
    end
    file_raw.close
  end
end