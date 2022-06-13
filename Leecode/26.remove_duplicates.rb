# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return nums.length if nums.length < 2

  nums.uniq!
  nums.size
end
