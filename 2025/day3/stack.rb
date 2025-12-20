#!/usr/bin/env ruby

# Stack-based greedy algorithm (proven correct)
def maximize_with_stack(digits, k)
  result = []
  to_remove = k
  
  digits.each do |digit|
    while to_remove > 0 && !result.empty? && result.last < digit
      result.pop
      to_remove -= 1
    end
    result << digit
  end
  
  result = result[0...(result.size - to_remove)] if to_remove > 0
  result.join.to_i
end

# Your two-pass algorithm (fixed edge condition)
def maximize_your_way(line_str)
  arr = line_str.chomp.chars.map(&:to_i)
  
  delete_count = 0
  delete_list = []

  # First pass - delete ascending violations
  arr.each_with_index do |num, posn|
    break if posn == arr.length - 1

    if num < arr[posn + 1]
      delete_list << posn
      delete_count += 1
    elsif num == arr[posn + 1]
      if bigger_num_ahead?(num, posn, arr)
        delete_list << posn
        delete_count += 1
      end
    end

    break if delete_count == 3
  end

  delete_list.sort.reverse.each { |posn| arr.delete_at(posn) }
  delete_list = []
  
  # Second pass - delete descending violations  
  if delete_count < 3
    (arr.size - 1).downto(1) do |posn|  # Changed to downto(1)
      if arr[posn] <= arr[posn - 1]
        delete_list << posn
        delete_count += 1
      end

      break if delete_count == 3
    end
  end

  delete_list.sort.reverse.each { |posn| arr.delete_at(posn) }
  
  arr.join.to_i
end

def bigger_num_ahead?(num, posn, arr)
  arr[posn + 1 .. arr.length - 1].each do |num2|
    if num2 > num
      return true
    elsif num2 < num
      return false
    end
  end
  false
end

# Compare both algorithms
stack_sum = 0
your_sum = 0
differences = []

File.open("input.txt").each_with_index do |line, idx|
  arr = line.chomp.chars.map(&:to_i)
  digits_to_remove = 3
  
  stack_result = maximize_with_stack(arr, digits_to_remove)
  your_result = maximize_your_way(line)
  
  stack_sum += stack_result
  your_sum += your_result
  
  if stack_result != your_result
    differences << {
      line_num: idx + 1,
      input: line.chomp,
      stack: stack_result,
      yours: your_result,
      diff: stack_result - your_result
    }
  end
end

puts "=" * 80
puts "SUMMARY"
puts "=" * 80
puts "Stack algorithm total: #{stack_sum}"
puts "Your algorithm total:  #{your_sum}"
puts "Difference:            #{stack_sum - your_sum}"
puts "\nLines with differences: #{differences.size}"
puts

if differences.any?
  puts "=" * 80
  puts "DIFFERENCES (first 10)"
  puts "=" * 80
  differences.first(10).each do |diff|
    puts "\nLine #{diff[:line_num]}: #{diff[:input]}"
    puts "  Stack result: #{diff[:stack]}"
    puts "  Your result:  #{diff[:yours]}"
    puts "  Difference:   #{diff[:diff]}"
  end
end
