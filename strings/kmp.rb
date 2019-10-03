class KMP
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def search(pattern)
    lps = compute_lps(pattern)
    puts "LPS: #{pattern} -> #{lps}"

    result = []
    i = 0
    p = 0
    while i < text.size
      if text[i] == pattern[p]
        i += 1
        p += 1
        if p == pattern.size
          result.push(i - p)
          p = lps[p - 1]
        end
      else
        if p > 0
          p = lps[p - 1]
        else
          i += 1
        end
      end
    end
    result
  end

  private

  def compute_lps(pattern)
    lps = Array.new(pattern.size, 0)
    len = 0
    i = 1

    while i < pattern.size
      if pattern[i] == pattern[len]
        len += 1
        lps[i] = len
        i += 1
      elsif len > 0
        len = lps[len - 1]
      else
        lps[i] = len # 0
        i += 1
      end
    end

    lps
  end
end

puts KMP.new('ABABDABACDABABCABAB').search('ABABCABAB').eql?([10])
puts KMP.new('ABABDABACDABABCABAB').search('ABAB').eql?([0, 10, 15])
puts KMP.new('AAAAABAAABA').search('AAAA').eql?([0, 1])
puts KMP.new('AAAABAAAAABBBAAAAB').search('AAAB').eql?([1, 7, 14])
puts KMP.new('AAAABAAAAABABABAAAB').search('ABABAB').eql?([9])
