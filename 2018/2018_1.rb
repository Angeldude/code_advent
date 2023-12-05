file = "freq.txt"

bop = []
File.foreach(file) do |line|
  bop.push line.to_i
end

p bop.sum
