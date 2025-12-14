#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

dial = Array.new(100) { |i| i }
zero_count = 0
index = 50
zero_count = 0

File.read("input.txt").split("\n").each do |line|

  if line[0] == "L"
    (1..line[1..line.length].to_i).each do
      index - 1 < 0 ? index = 99 : index -= 1
      zero_count+= 1 if index == 0
    end
  else
    (1..line[1..line.length].to_i).each do
      index + 1 > 99 ? index = 0 : index += 1
      zero_count += 1 if index == 0
    end
  end

  puts "- The dial is rotated #{line} to point at #{index}"
end

puts "the secret code is #{zero_count}"

