list = []

File.foreach("larp.txt") do |line|
 list << line.chomp.to_i
end

t = list.first
arr = []
list.each do |x|
  arr << x if x > t
  t = x
end

p arr.size