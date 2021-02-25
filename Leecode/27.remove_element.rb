# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
	# 1
	# nums.delete(val)
	# nums.length

	# 2
	# (nums[0...nums.length] = nums - [val]).length

	# 3
	nums.delete_if{|x| x==val}
    nums.length
end

puts remove_element [1,2,3,4,5] , 1