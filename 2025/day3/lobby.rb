#!/home/dsp2/.local/share/mise/installs/ruby/3.4.7/bin/ruby

sum = 0

File.open("input.txt").each_line do |line|

  arr = line.chomp.chars.map(&:to_i)
  rev_arr = arr.reverse
  tens = arr.max
  tens_index = arr.size - rev_arr.index(tens) - 1

  if arr.one?(tens) == false
    ones = tens
  elsif tens_index == arr.size - 1
    ones = tens
    tens = arr[0..tens_index - 1].max
  else
    ones = arr[tens_index + 1 .. arr.size - 1].max
  end

  sum += tens * 10 + ones
end

puts "sum: #{sum}"
