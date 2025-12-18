#!/home/dsp2/.local/share/mise/installs/ruby/3.4.7/bin/ruby

require 'set'

def find_bottom_3(arr)

  count = 0
  bottom_3 = Set.new

  (1..9).each do |i|
    arr.count(i).times do
      bottom_3.add(i) unless count > 3
      count += 1
      break if count >= 3
    end
    break if count >= 3
  end
  bottom_3
end

sum = 0

File.open("input.txt").each_line do |line|

  arr = line.chomp.chars.map(&:to_i)

  bottom_3 = find_bottom_3(arr)
  puts "the bottom_3 of #{line} are #{bottom_3.to_a.to_s}"
end

puts "sum: #{sum}"

