#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

num_lines = File.read("input.txt").lines.count
# num_expressions = File.read("input.txt").lines[0].split(" ").count
# grid = Array.new(num_lines) { Array.new(num_expressions) }
total = 0

puts "num lines: #{num_lines}"
# puts "num expressions: #{num_expressions}"

# File.foreach("input.txt").with_index do |line, row|
# 
#   line.split(" ").each_with_index do |expression, col|
#     grid[row][col] = expression
#   end
# end

new_expression = true
num_expressions = File.read("input.txt").lines[0].split(" ").count
operator = ""
expression_total = 0

File.open("input.txt") do |file|
  lines = file.readlines
  expression_size = (lines[0].length / num_expressions) - 1
  puts "expression size: #{expression_size}"

  lines[0].chars.each_with_index do |c, index|
    puts "start of index: #{index} - operator: #{operator} expression_total: #{expression_total}"
    if index % (expression_size + 1) == 0
      puts "index: #{index} - gonna set operator and expression total"
      operator = lines[num_lines-1][index]
      puts "operator: #{operator}"
      operator == '+' ? expression_total = 0 : expression_total = 1
    end
  
    if index % expression_size != 1 && index != 1
      puts "index: #{index} - gonna run down a column"
      expression = ""
      (0..num_lines-2).each do |row|
        expression.concat(lines[row][index])
        puts "expression: #{expression}"
      end

      puts "index: #{index} expression: #{expression} operator: #{operator} expression_total: #{expression_total}"
      if operator == '+'
        expression_total += expression.to_i
      else
        expression_total *= expression.to_i
      end
      puts "expression_total: #{expression_total}"
    end

  end
end



