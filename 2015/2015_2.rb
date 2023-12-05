file = "input.txt"

def dimensions l, w, h
  total = (2*l*w) + (2*w*h) + (2*h*l)
  mins = shortest_sides [l,w,h]
  total + (mins[:min] * mins[:second_min])
end

def split_nums str_line
  str_line.split('x').map(&:to_i)
end

def shortest_sides temp
  one = temp.min
  temp.delete_at(temp.index one)
  two = temp.min
  {min: one, second_min: two}
end

def cube l,w,h
  l*w*h
end

def perimeter mins
  (2 * mins[:min]) + (2 * mins[:second_min])
end

def ribbon l,w,h
  cube(l,w,h) + perimeter(shortest_sides [l,w,h])
end

def wrap_up filename, func
  nums = []
  File.foreach(filename) do |line|
    nums.push match_line(split_nums(line), func)
  end
  nums.sum
end

def match_line num_line, func
  method(func).call(num_line[0], num_line[1], num_line[2])
end

p wrap_up file, :dimensions
p wrap_up file, :ribbon
