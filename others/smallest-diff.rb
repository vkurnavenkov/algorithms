# Smallest Difference pair of values between two unsorted Arrays
#
# Given two arrays of integers, compute the pair of values (one value in each array) with the smallest (non-negative) difference. Return the difference.
#
# Examples:
#
# Input : A[] = {l, 3, 15, 11, 2}
#         B[] = {23, 127, 235, 19, 8}
# Output : 3
# That is, the pair (11, 8)
#
# Input : A[] = {l0, 5, 40}
#         B[] = {50, 90, 80}
# Output : 10
# That is, the pair (40, 50)

def find_smallest_diff(arr1, arr2)
  arr1.sort!
  arr2.sort!
  diff = 1.fdiv(0)
  p1 = 0
  p2 = 0
  while p1 < arr1.size && p2 < arr2.size
    val = (arr1[p1] - arr2[p2]).abs
    diff = val if val < diff

    if arr1[p1] < arr2[p2]
      p1 += 1
    else
      p2 += 1
    end
  end

  diff
end

arr1 = [1, 3, 15, 11, 2]
arr2 = [23, 127, 235, 19, 8]

puts find_smallest_diff(arr1, arr2) # 3
