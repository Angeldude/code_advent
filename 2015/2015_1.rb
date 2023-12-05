file = "input.txt"

def floor paren
  paren == '(' ? 1 : -1
end

def position input
  tmp = 0
  input.chars.each_with_index do |x,i|
    tmp += floor(x)
    if tmp == -1
      return i+1
    end
  end
end

# floor_number  = input.chars.map{|x| floor x }.sum
# pos = position(input)
