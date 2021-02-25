# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
	num = nums.uniq

	return false if nums.length == num.length
	return true
end