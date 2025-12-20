#!/home/dsp2/.local/share/mise/installs/ruby/3.4.7/bin/ruby

def maximize_by_removing_k (arr,k)

  to_delete = k
  result = []

  arr.each do |num|

    while to_delete > 0 && !result.empty? && result.last < num
      result.pop
      to_delete -= 1
    end
    result << num
  end

  result = result[0 .. (result.length - to_delete)] if to_delete > 0

  result.join
end

sum = 0

File.open("input.txt").each_line do |line|

  arr = line.chomp.chars.map(&:to_i)

  puts "line is #{line}"
  puts "arr is #{arr.to_s}"
  puts "length is #{line.length}"
  maxed_num = maximize_by_removing_k(arr,arr.size - 12)

  puts "new num is #{maxed_num}"
  puts "new length is #{maxed_num.length}"
  puts
  sum += maxed_num.to_i
end

puts "sum: #{sum}"

