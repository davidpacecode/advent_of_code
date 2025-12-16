#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def sum_codes(sub_str, num)
  sum = 0
  sub_str.length - 1.downto(0) do |i|
    if num.length.to_i % sub_str.length.to_i == 0
      # puts "about to see if #{sub_str[0..i]} repeats within #{num}"
      if num == "1188511885"
        puts "fuck you"
        puts "about to test sub_str = #{sub_str[0..i]}"
      end
      if is_repeating(sub_str[0..i], num)
        sum += num.to_i
        puts "#{num} has repeating elements, according to me... "
        return sum
      end
    end
  end
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

File.read("input_part_2.txt").split(",").each do |line|

  print "#{line.split('-')[0].to_i} - #{line.split('-')[1].to_i}: "
  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    if num.to_s.length.even?
      sum += sum_codes(num.to_s[0..(num.to_s.length/2) - 1],num.to_s)
    else
      sum += sum_codes(num.to_s[0..(num.to_s.length/3) - 1],num.to_s)
    end
  end
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

