file = "input.txt"

def str_convert line
  line.chomp.to_i
end

def mathy num
  tmp = num/3
  if tmp <= 0
    tmp
  else
   tmp - 2
  end
end

stuff = []
File.foreach(file) do |line|
  stuff.push mathy(str_convert(line))
end

#stuff.each do |mod|
#  tmp = mathy mod
#end

p stuff.sum
