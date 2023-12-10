def forbidden word
  %w[ ab cd pq xy ].map{|x| !!word[x]}.any?
end

def vowel_count word
  word.chars.filter {|x| x if %w[a e i o u].include? x}.size
end

def doubles word
  word.chars.each_with_index do |letter, idx|
    if !(idx == word.size - 1)
      return true if letter == word[idx+1]
    end
  end
  false
end

def list_walk file
  bools = []
  File.foreach(file) do |line|
    count = vowel_count line.chomp
    doubled = doubles line.chomp
    not_verboten = !forbidden(line.chomp)
    bools.push(count >= 3 && doubled && not_verboten)
  end
  bools.filter{|x| x }.size
end

p list_walk("input.txt")
