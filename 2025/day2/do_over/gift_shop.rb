#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def is_repeating? (sub_str, str)

  temp_str = ""
  reps = str.length / sub_str.length

  reps.times do
    temp_str = temp_str.concat(sub_str)
  end

  temp_str == str ? true : false
end

def made_of_repeating_str? (str)

  
  (str.length/2 - 1).downto(0).each do |i|
    return true if is_repeating?(str[0..i],str)
  end

  false
end

sum = 0

File.read("input.txt").split(',').each do |line|

  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    sum += num if made_of_repeating_str?(num.to_s)
  end
end

puts "sum: #{sum}"














# puts "Does 11 repeat in 11? #{is_repeating?("11", "11")}"
# puts "Does 1 repeat in 111111? #{is_repeating?("1", "111111")}"
# puts "Does 1024 repeat in 10241023? #{is_repeating?("1024", "10241023")}"
# puts "Does 1188511885 repeat in 1188511885? #{is_repeating?("11885", "1188511885")}"
# puts "Does 743 repeat in 743743743? #{is_repeating?("743", "743743743")}"
