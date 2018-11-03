# Coursera
#
class CustomHash
  def initialize
    @data = {}
  end

  def process(action, number, param = nil)
    case action
    when 'add'
      @data[number] = param
      nil
    when 'del'
      @data.delete(number)
      nil
    when 'find'
      @data[number] || 'not found'
    end
  end
end

# Input
# input = "12 add 911 police add 76213 Mom add 17239 Bob find 76213 find 910 find 911 del 910 del 911 find 911 find 76213 add 76213 daddy find 76213"
# _, *raw_data = input.split(/\s+/)
_, *raw_data = STDIN.read.chomp.split(/\s+/)

# Process and Output
hash = CustomHash.new
idx = 0
while idx < raw_data.size
  if raw_data[idx] == 'add'
    params = raw_data[idx..idx + 2]
    idx += 3
  else
    params = raw_data[idx..idx + 1]
    idx += 2
  end

  rv = hash.process(*params)
  puts rv if rv
end
