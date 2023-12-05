def translate char
  case char
  when "^"
    "y"
  when ">"
    "x"
  when "<"
    "-x"
  when "v"
    "-y"
  end
end

def convert char
  case char
  when "y", "x"
    1
  when "-y", "-x"
    -1
  end
end

def update coord, char
  numsX, numsY = coord_convert(coord)
  point = translate char
  math = convert point
  case point
  when "x", "-x"
    numsX += math
  when "y", "-y"
    numsY += math
  end
  [numsX, numsY].join(',')
end

def coord_convert str
  str.split(',').map(&:to_i)
end

def robo_santa inputs
  inputs.chars.filter.with_index {|x,i| x if i.odd?}
end

def santa inputs
  inputs.chars.filter.with_index {|x,i| x if i.even?}
end

def the_loop temp, count, input
  input.chars.each do |x|
    temp = update(temp, x)
    if count[temp].nil?
      count[temp] = 1
    end
  end
  return count
end

def counter input, input2 = nil
  count = {"0,0" => 1}
  temp = "0,0"

  count = the_loop temp, count, input
  if input2
    count = the_loop temp, count, input2
  end
  count.keys.size
end

def count_double_santas input
  rSanta = robo_santa(input).join
  sant = santa(input).join

  counter rSanta, sant
end

puts "3rd rung of the tree 2015!"
vv = "^>v<"
vvv = "^v"
vvvv = "^v^v^v^v^v"
vvvvv = "v>v<vvv<<vv^"

p (counter(">") == 2)
p (counter(vv) == 4)
p (counter(vvvv) == 2)
p (counter(vvvvv) == 12)

file = File.read("input.txt")

p counter(file.chomp)

p (count_double_santas(vv) == 3)
p (count_double_santas(vvv) == 3)
p (count_double_santas(vvvv) == 11)
p (count_double_santas(vvvvv) == 10)

p count_double_santas file.chomp
