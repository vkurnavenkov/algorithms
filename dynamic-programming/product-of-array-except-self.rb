def product_except_self_buffer(nums)
    result = Array.new(nums.size, 1)
    buffer = Array.new(nums.size, 1)
    (1..nums.size - 1).each do |i|
        result[i] = result[i - 1] * nums[i - 1]
    end
    (nums.size - 2).downto(0).each do |i|
        buffer[i] = buffer[i + 1] * nums[i + 1]
    end
    (0..nums.size - 1).each do |i|
        result[i] *= buffer[i]
    end
    result
end

def product_except_self(nums)
    result = Array.new(nums.size, 1)
    (1..nums.size - 1).each do |i|
        result[i] = result[i - 1] * nums[i - 1]
    end
    mult = 1
    (nums.size - 2).downto(0).each do |i|
        mult *= nums[i + 1]
        result[i] *= mult
    end
    result
end

puts product_except_self([1,2,3,4]).to_s # [24,12,8,6]
