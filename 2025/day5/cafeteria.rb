#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

fresh_ranges = {}
fresh_count = 0

File.foreach("input.txt") do |line|
  puts line
  if line.include?('-')
    (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |i|
      puts "i: #{i}"
      fresh_ranges[i] = 1
    end
  else
    fresh_count += 1 if fresh_ranges[line.to_i] == 1
  end
end

puts "fresh_count: #{fresh_count}"
