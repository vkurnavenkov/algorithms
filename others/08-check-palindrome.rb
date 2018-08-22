def palindrome?(str)
  mid = str.size / 2
  (0..mid - 1).all? do |i|
    str[i] == str[str.size - 1 - i]
  end
end

puts palindrome?('asdfggfdsa') # true
puts palindrome?('asdfghgfdsa') # true
puts palindrome?('asdfgfdsa') # true
puts palindrome?('asdfg1fdsa') # true
