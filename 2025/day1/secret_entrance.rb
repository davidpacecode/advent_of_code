#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

dial = Array.new(100) { |i| i }

zero_count = 0
index = 50

File.read("input.txt").split("\n").each do |line|
  line[0] == "L" ? index-=line[1..2].to_i : index+=line[1..2].to_i
  puts "#{index}"
end

