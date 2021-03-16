# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    return [] if nums.nil? || nums.empty? || nums.length < 3
    nums.sort!
    return [] if nums[0] > 0 || nums[-1] < 0
    result = []
    i = 0
    while i < (length = nums.length)
        break if nums[i] > 0
        l_index, r_index = i + 1, length - 1

        while l_index < r_index
            sum = nums[i] + nums[l_index] + nums[r_index]
            if sum == 0
                result.push([nums[i], nums[l_index], nums[r_index]])
                l_index += 1
                l_index += 1 until nums[l_index] != nums[l_index-1]
                r_index -= 1
                r_index -= 1 until nums[r_index] != nums[r_index+1]
            elsif sum > 0
                r_index -= 1
            elsif sum < 0
                l_index += 1
            end
        end
        i += 1
        i += 1 until nums[i] != nums[i-1]
    end
    result
end