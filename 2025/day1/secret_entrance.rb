#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

dial = Array.new(100) { |i| i }

def adjust_dial (current, direction, amount)
  direction == "L" ? current = current - amount : current = current + amount
  case current
  when current < 0
    current = 100 - current
  when current >= 100
    current = current - 100
  else
    current
  end
end



zero_count = 0
index = 50

File.read("input.txt").split("\n").each do |line|
# line[0] == "L" ? index-=line[1..2].to_i : index+=line[1..2].to_i
  puts "line = #{line} index = #{index} direction = #{line[0]} amount = #{line[1..2].to_i}"
  index = adjust_dial(index, line[0], line[1..2].to_i)
  puts "#{index}"
end

