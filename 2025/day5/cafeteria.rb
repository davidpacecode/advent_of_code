#!/home/dsp2/.local/share/mise/installs/ruby/3.3.4/bin/ruby

def is_fresh?(num,fresh_ranges)

  fresh_ranges.each do |range|
    if(num >= range.split('-')[0].to_i && num <= range.split('-')[1].to_i)
      return true
    end
  end
  return false
end

fresh_ranges = []
fresh_count = 0

File.foreach("input.txt") do |line|
  if line.include?('-')
    fresh_ranges << line
  else
    fresh_count += 1 if is_fresh?(line.to_i,fresh_ranges)
  end
end

puts "fresh_count: #{fresh_count}"

