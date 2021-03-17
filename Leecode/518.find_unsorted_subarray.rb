# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
	sorts = nums.sort
	return 0 if nums.eql?(sorts)
	e = nums.length
	flagf = 0
	flage
	(0..e).each do |i|
		if nums[i] != sorts[i]
			flagf = i
			break
		end
	end

	while e > 0
		if nums[e] != sorts[e]
			flage = e
			break
		end
		e -= 1
	end
	flage - flagf + 1
end

puts find_unsorted_subarray([2,6,4,8,10,9,15])
# [2,6,4,8,10,9,15]
# [2,4,6,8,9,10,15]