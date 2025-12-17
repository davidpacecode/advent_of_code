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

File.read("input_part_2.txt").split(',').each do |line|

  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    sum += num if made_of_repeating_str?(num.to_s)
  end
end

puts "sum: #{sum}"

