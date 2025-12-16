#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def sum_codes(sub_str, num)
  sum = 0
  sub_str.length.downto(1) do |i|
    if num.length.to_i % sub_str.length.to_i == 0
      # puts "about to see if #{sub_str[0..i]} repeats within #{num}"
      if is_repeating(sub_str[0..i-1], num)
        # puts "about to add #{num} to the sum"
        sum += num.to_i
        print " #{num}"
      end
    end
  end
  return sum
end

def is_repeating(sub_str, num)
  comp_str = ""
  num_iterations = num.length / sub_str.length
  num_iterations.times do
    comp_str = comp_str.concat(sub_str)
  end
  comp_str == num ? true : false
end

sum = 0
puts "sum is #{sum}"

File.read("input_part_2.txt").split(",").each do |line|

  print "#{line.split('-')[0]} - #{line.split('-')[1]}: "
  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    if num.to_s.length.even?
      sum += sum_codes(num.to_s[0..(num.to_s.length/2) - 1],num.to_s)
      # puts "running sum is now #{sum}"
    else
      sum += sum_codes(num.to_s[0..(num.to_s.length/3) - 1],num.to_s)
      # puts "running sum is now #{sum}"
      # puts "found an odd one"
    end
  end
  puts
  puts "sum is currently #{sum}"
  puts
end

puts "sum: #{sum}"

# puts "11 11 #{is_repeating("11", "11")}"
# puts "11 111111 #{is_repeating("11", "111111")}"
# puts "1024 10241023 #{is_repeating("1024", "10241023")}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"

