file = "sum.txt"

def spread line
  line.chomp.split("\t")
end

def convert line
  line.map(&:to_i)
end

def difference line
  line.max - line.min
end

sum = []
File.foreach(file) do |x|
  sum.push difference(convert(spread(x)))
end

p sum.sum
