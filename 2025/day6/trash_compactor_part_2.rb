#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

num_lines = File.read("input.txt").lines.count
total = 0
operator = ""
expression_total = 0

File.open("input.txt") do |file|
  lines = file.readlines

  lines[0].chars.each_with_index do |c, index|
    if lines[num_lines-1][index] == '*' || lines[num_lines-1][index] == '+'
      operator = lines[num_lines-1][index]
      operator == '+' ? expression_total = 0 : expression_total = 1
    end
  
    expression = ""
    (0..num_lines-2).each do |row|
      expression.concat(lines[row][index])
    end

    if operator == '+'
      expression_total += expression.to_i unless expression == ""
    else
      expression_total *= expression.to_i unless expression == ""
    end
    if lines[num_lines-1][index+2] == '*' || lines[num_lines-1][index+2] == '+' || index == lines[0].length-1
      total += expression_total
    end
  end
  puts "total: #{total}"
end
