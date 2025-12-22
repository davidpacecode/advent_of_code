#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def count_adjacencies (grid,r,c,num_lines,line_length)

  adjacencies = 0

  # row above adjacencies
  if r != 0
    if c != 0
      adjacencies += 1 if grid[r-1][c-1] == '@'
    end
    adjacencies += 1 if grid[r-1][c] == '@'
    if c != line_length - 1
      adjacencies += 1 if grid[r-1][c+1] == '@'
    end
  end

  # same row adjacencies
  adjacencies += 1 if c != 0 && grid[r][c-1] == '@'
  adjacencies += 1 if c != (line_length - 1) && grid[r][c+1] == '@'

  # bottom row adjacencies
  if r != num_lines - 1
    if c != 0
      adjacencies += 1 if grid[r+1][c-1] == '@'
    end
    adjacencies += 1 if grid[r+1][c] == '@'
    if c != line_length - 1
      adjacencies += 1 if grid[r+1][c+1] == '@'
    end
  end

  adjacencies
end

def print_grid (grid)
  grid.each_with_index do |row, r|
    row.each_with_index do |col, c|
      print "#{grid[r][c]}"
    end
    puts
  end
end

lines = File.read("input.txt").lines
num_lines = lines.count
line_length = lines[0].chomp.length
accessible_rolls = 0
remove_list = []
deletes_remain = true

grid = Array.new(num_lines) { Array.new(line_length) }

puts "num_lines is #{num_lines}"
puts "line_length is #{line_length}"

# initialize the grid
lines.each_with_index do |line, i|
  line.chomp.chars.each_with_index do |char, j|
    grid[i][j] = char
  end
end

puts
print_grid (grid)
puts

while deletes_remain
  grid.each_with_index do |row, r|
    row.each_with_index do |col, c|
      if grid[r][c] == '@'
        accessible_rolls += 1 if count_adjacencies(grid,r,c,num_lines,line_length) < 4
        remove_list << [r,c]
        print "#{count_adjacencies(grid,r,c,num_lines,line_length)}"
      else
        print "#{grid[r][c]}"
      end
    end
    puts
  end

  puts

  deletes_remain = true if remove_list.length > 0
  while remove_list.length > 0
    grid[remove_list.pop[0]][remove_list.pop[1]] = 'x'
  end
end

puts "accessible rolls: #{accessible_rolls}"
