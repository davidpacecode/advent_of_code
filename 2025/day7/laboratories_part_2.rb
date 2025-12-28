#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def handle_splitter(lines,row,index)
  if row == lines.count-1
    return 1
  end
end

num_timelines = 0

File.open("input.txt") do |file|

  lines = file.readlines
  path = lines[0].index('S')

  lines[1..lines.count-1].each_with_index do |line, row|
    line.chars.each_with_index do |c, index|
      if c == '^'
        num_timelines = handle_splitter(lines,row,index)
      end
    end
  end
end

puts "num_timelines: #{num_timelines}"

