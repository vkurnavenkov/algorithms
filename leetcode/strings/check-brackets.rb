#/usr/bin/env ruby

def check_brackets(str)
  stack = []
  mapping = {
    '{' => '}',
    '(' => ')',
    '[' => ']'
  }

  open_brackets = mapping.keys
  close_brackets = mapping.values

  chars = str.chars

  idx = 0
  while idx < str.length
    c = chars[idx]
    if open_brackets.include?(c)
      stack.push([c, idx])
    elsif close_brackets.include?(c)
      return idx + 1 if stack.empty?
      peek, peek_idx = stack.pop
      return idx + 1 unless mapping[peek] == c
    end
    idx += 1
  end

  stack.empty? ? 'Success' : stack[-1].last + 1
end

str = gets.chomp

puts check_brackets(str)
