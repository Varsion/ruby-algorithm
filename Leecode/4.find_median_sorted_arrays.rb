# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  count = nums1 + nums2
  count.sort!
  mid = count.length / 2
  if count.length % 2 == 0
    (count[mid] + count[mid - 1]) / 2.0
  else
    count[mid] / 1.0
  end
end
