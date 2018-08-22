# Find the closest pair from two sorted arrays
# Given two sorted arrays and a number x,
# find the pair whose sum is closest to x and the pair has an element from each array.
#
# Input:  ar1[] = {1, 4, 5, 7};
#         ar2[] = {10, 20, 30, 40};
#         x = 32
# Output:  1 and 30
#
# Input:  ar1[] = {1, 4, 5, 7};
#         ar2[] = {10, 20, 30, 40};
#         x = 50
# Output:  7 and 40

def closest_pair(arr1, arr2, x)
  l = 0
  r = arr2.size - 1
  diff = 1.fdiv(0) # Infinity
  rv_l = nil
  rv_r = nil

  while l < arr1.size && r >= 0
    val = (arr1[l] + arr2[r] - x).abs
    if val < diff
      diff = val
      rv_l = l
      rv_r = r
    end

    if arr1[l] + arr2[r] < x
      l += 1
    else
      r -= 1
    end
  end

  [arr1[rv_l], arr2[rv_r]]
end

arr1 = [1, 4, 5, 7]
arr2 = [10, 20, 30, 40]

puts closest_pair(arr1, arr2, 32).to_s # 1, 30
puts closest_pair(arr1, arr2, 38).to_s # 7, 30
