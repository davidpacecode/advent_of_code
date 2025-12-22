#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

fresh_ranges = []
fresh_count = 0

File.foreach("input.txt") do |line|
  if line.include?('-')
    (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |i|
      fresh_ranges[i] = 1
    end
  else
    fresh_count += 1 if fresh_ranges[line.to_i] == 1
  end
end

fresh_ranges.each_with_index do |range, i|
  puts "range #{i}: #{range}"
end

puts "fresh_count: #{fresh_count}"
