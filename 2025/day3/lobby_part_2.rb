#!/home/dsp2/.local/share/mise/installs/ruby/3.4.7/bin/ruby

def bigger_num_ahead?(num,posn,arr)
  arr[posn + 1 .. arr.length - 1].each do |num2|
    if num2 > num
      return true
    elsif num2 < num
      return false
    end
  end
  false
end

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
    elsif num == arr[posn + 1]
      if bigger_num_ahead?(num,posn,arr)
        delete_list << posn
        delete_count += 1
      end
    end

    break if delete_count == 3
  end

  delete_list.sort.reverse.each { |posn| arr.delete_at(posn) }

  puts

  arr2 = Marshal.load(Marshal.dump(arr))
  delete_list = []
  if delete_count < 3

    (arr2.size - 1).downto(1) do |posn|
      if arr2[posn] <= arr2[posn - 1]
        delete_list << posn
        delete_count += 1
      end

      break if delete_count == 3
    end
  end

  delete_list.sort.reverse.each { |posn| arr2.delete_at(posn) }

  puts "arr2.length: #{arr2.length}"
  val = ""
  arr2.each { |num| val.concat(num.to_s) }
  puts "#{val}"
  puts
  sum += val.to_i
end

puts "sum: #{sum}"

