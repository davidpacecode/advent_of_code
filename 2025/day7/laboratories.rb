#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

num_splits = 0
beams = []

File.open("input.txt") do |file|

  lines = file.readlines

  beams << lines[0].index('S')

  lines[1..lines.count-1].each do |line|
    line.chars.each_with_index do |c, index|
      
    end
  end
end
