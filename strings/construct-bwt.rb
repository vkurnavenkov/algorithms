# Construct the Burrows–Wheeler Transform of a String
#
def construct_bwt(str)
  result = []
  rotated = str.chars
  str.length.times do
    rotated = rotated.rotate(-1)
    result.push(rotated.join)
  end
  result.sort.map { |ar| ar[-1] }.join
end

str = gets.chomp
puts construct_bwt(str)
