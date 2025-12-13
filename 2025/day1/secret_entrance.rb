#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

dial = Array.new(100) { |i| i }

def adjust_dial (current, direction, amount)
  puts "current before the adjustment = #{current}"
  
  # direction == "L" ? current = current - amount : current = current + amount
  if direction == "L"
    current-= amount
  else
    current+= amount
  end

  puts "current after the adjustment = #{current}"

  direction == "L" ? "direction is L" : "direction is R"
  current < 0 ? "current is less than 0" : "current is more than 0"
  if current < 0
    puts "current is less than 0"
    current = 100 - current
  elsif current >= 100
    puts "current is greater than or equal to 100"
    current = current - 100
  else
    puts "current is good"
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

