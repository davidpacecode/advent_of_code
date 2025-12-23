#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

num_lines = File.read("input.txt").lines.count
num_expressions = File.read("input.txt").lines[0].split(" ").count
grid = Array.new(num_lines) { Array.new(num_expressions) }
total = 0

puts "num lines: #{num_lines}"
puts "num expressions: #{num_expressions}"

File.foreach("input.txt").with_index do |line, row|

  line.split(" ").each_with_index do |expression, col|
    grid[row][col] = expression
  end
end

(0..num_expressions).each do |col|
  operator = grid[num_lines-1][col]
  operator == '+' ? expression = 0 : expression = 1
  (0..num_lines-2).each do |row|
    if operator == '+'
      expression += grid[row][col].to_i
    else
      expression *= grid[row][col].to_i
    end
  end
  total += expression
end

puts "total: #{total}"
