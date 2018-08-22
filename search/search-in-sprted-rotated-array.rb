def bin_search(nums, l, r, target)
    puts "#{l}..#{r}"
    return -1 if l > r
    mid = (r + l) / 2
    return mid if nums[mid] == target
    if nums[l] <= nums[mid]
        if target >= nums[l] && target <= nums[mid]
            bin_search(nums, l, mid - 1, target)
        else
            bin_search(nums, mid + 1, r, target)
        end
    else
        if target >= nums[mid] && target <= nums[r]
            bin_search(nums, mid + 1, r, target)
        else
            bin_search(nums, l, mid - 1, target)
        end
    end
end

def search(nums, target)
    bin_search(nums, 0, nums.size - 1, target)
end

puts search([4,5,6,7,0,1,2], 0) # 4
puts search([4,5,6,7,0,1,2], 3) # -1
