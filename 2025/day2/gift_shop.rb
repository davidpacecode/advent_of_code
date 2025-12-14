#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

sum = 0

File.read("input.txt").split(",").each do |line|

  (line.split('-')[0].to_i..line.split('-')[1].to_i).each do |num|
    if num.to_s.length.even?
      if num.to_s[0 .. num.to_s.length/2 - 1] == num.to_s[num.to_s.length/2 .. num.to_s.length - 1]
        sum += num
      end
    end
  end
end

puts "the sum is #{sum}"

