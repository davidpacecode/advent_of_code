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

def is_bigger_ahead?(num, posn, arr)
  arr[posn..arr.length - 1].each do |n|
    return true if n >= num
  end
  false
end

sum = 0

File.open("input.txt").each_line do |line|

  arr = line.chomp.chars.map(&:to_i)

  bottom_3 = find_bottom_3(arr)
  puts "arr.length: #{arr.length}"
  puts "the bottom_3 of #{line} are #{bottom_3.to_a.to_s}"

  delete_count = 0

  arr.each_with_index do |num, posn|
    if bottom_3.include?(num)
      arr.delete_at(posn) if is_bigger_ahead?(num, posn, arr) and delete_count < 3
      delete_count += 1
      break if delete_count == 3
    end
  end

  puts "arr.length: #{arr.length}"
  puts "arr is now #{arr.to_s}"
end

puts "sum: #{sum}"

