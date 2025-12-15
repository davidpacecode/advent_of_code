#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def sum_codes(sub_str, num)
  sum = 0
  sub_str.to_s.length.downto(1) do |i|
    puts "i is #{i}"
  end
 5 
end

def is_repeating(sub_str, num)
  comp_str = ""
  num_iterations = num.to_s.length / sub_str.to_s.length
  num_iterations.times do
    comp_str = comp_str.concat(sub_str.to_s)
  end
  comp_str == num.to_s ? true : false
end

sum = 0

File.read("input_part_2.txt").split(",").each do |line|

  puts "#{line.split('-')[0].to_i} - #{line.split('-')[1].to_i}"
  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    if num.even?
      sum += sum_codes(num,num/2)
    else
      sum += sum_codes(num,num/3)
    end
  end
end


puts "11 11 #{is_repeating(11, 11)}"
puts "11 111111 #{is_repeating(11, 111111)}"
puts "1024 10241023 #{is_repeating(1024, 10241023)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"
# puts "11 11 #{is_repeating(11, 11)}"

