#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

fresh_ranges = []
integrated_ranges = []

File.foreach("input.txt") do |line|
  if line.include?('-')
    fresh_ranges << [line.split('-')[0].to_i,line.split('-')[1].to_i]
  end
end

fresh_ranges.each { |min,max| puts "min: #{min}, max: #{max}" }

puts "press enter to continue"
gets
fresh_ranges.sort!

fresh_ranges.each { |min,max| puts "min: #{min}, max: #{max}" }

puts "press enter to continue"
gets

integrated_ranges << fresh_ranges.first
ir_index = 0
fresh_count =0

fresh_ranges[1..fresh_ranges.length - 1].each do |range|

  if range[0] <= integrated_ranges[ir_index][1]
    if range[1] <= integrated_ranges[ir_index][1]
      # do nothing...move on...
    else
      integrated_ranges[ir_index][1] = range[1]
    end
  else
    ir_index += 1
    integrated_ranges << range
  end
end

integrated_ranges.each { |min,max| puts "min: #{min}, max: #{max}" }

integrated_ranges.each { |min,max| fresh_count += max - min + 1 }

puts "fresh_count: #{fresh_count}"

