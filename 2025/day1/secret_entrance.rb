#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

dial = Array.new(100) { |i| i }
zero_count = 0
index = 50
zero_count = 0

File.read("input.txt").split("\n").each do |line|

  if line[0] == 'L'
    if (index - line[1..2].to_i) < 0
      index = 100 - (line[1..2].to_i - index)
    else
      index-= line[1..2].to_i
    end
  else
    if (index + line[1..2].to_i) >= 100
      index = index + line[1..2].to_i - 100
    else
      index+= line[1..2].to_i
    end
  end

  zero_count+= 1 if index == 0

  puts "- The dial is rotated #{line} to point at #{index}"
end

puts "the secret code is #{zero_count}"

