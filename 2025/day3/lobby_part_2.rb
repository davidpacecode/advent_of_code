#!/home/dsp2/.local/share/mise/installs/ruby/3.4.7/bin/ruby

sum = 0

File.open("input.txt").each_line do |line|

  arr = line.chomp.chars.map(&:to_i)

  delete_count = 0
  delete_list = []

  puts "line is #{line}"
  puts "arr is #{arr.to_s}"

  arr.each_with_index do |num, posn|

    break if posn == arr.length - 1

    if num < arr[posn + 1]
      delete_list << posn
      delete_count += 1
    end

    break if delete_count == 3
  end

  delete_list.sort.reverse.each { |posn| arr.delete_at(posn) }

  puts

  delete_list = []
  if delete_count < 3

    (arr.size - 1).downto(0) do |posn|
      if arr[posn] <= arr[posn - 1]
        delete_list << posn
        delete_count += 1
      end

      break if delete_count == 3
    end
  end

  delete_list.sort.reverse.each { |posn| arr.delete_at(posn) }

  puts "arr.length: #{arr.length}"
  val = ""
  arr.each { |num| val.concat(num.to_s) }
  puts "#{val}"
  puts
  sum += val.to_i
end

puts "sum: #{sum}"

