filenames = %w(a.png a.jpg a.pdf b.png c.txt e.iso f.bil g.tif h.sol)
extensions = %w(jpg txt png tif)

# Sort the filenames by extension using the extensions array for order.
#
def extract_ext(filename)
  filename.split('.').last
end

def task(filenames, extensions)
  map = Hash.new { |h, k| h[k] = extensions.size }
  extensions.each.with_index { |v, idx| map[v] = idx }
  filenames.sort do |a, b|
    a_idx = map[extract_ext(a)]
    b_idx = map[extract_ext(b)]
    a_idx <=> b_idx
  end
end

# So given the variables above the output would be this. Filenames who's
# extensions are present in the extensions array should come first, in the order
# given in the extensions array. If the extensions aren't in the extensions array
# it should be at the end of the array.

expected_result = %w(a.jpg c.txt a.png b.png g.tif a.pdf e.iso f.bil h.sol)

puts task(filenames, extensions) == expected_result ? 'Equal' : 'Not!!!'
