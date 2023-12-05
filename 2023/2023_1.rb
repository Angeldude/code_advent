def converter line
  tmp = line.chomp.chars.filter {|x| x.match? /[[:digit:]]/}
  (tmp.first + tmp.last)
end

jort = []
File.foreach("calibrate.txt") do |line|
  jort.push converter(line)
end

p jort.map(&:to_i).sum
