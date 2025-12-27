#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

require 'set'

num_splits = 0
beams = Set.new
new_beams = Set.new
blocked_beams = Set.new

File.open("input.txt") do |file|

  lines = file.readlines

  beams.add(lines[0].index('S'))

  lines[1..lines.count-1].each do |line|
    new_beams.clear
    blocked_beams.clear
    line.chars.each_with_index do |c, index|
      if c == '^'
        if beams.include?(index)
          num_splits += 1
          blocked_beams.add(index)
          new_beams.add(index - 1)
          new_beams.add(index + 1)
        end
      end
    end
    beams -= blocked_beams
    beams += new_beams
  end
end

puts "num_splits is #{num_splits}"
