# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  flag = 0
  maxc = nums[0]
  nums.each do |num|
    flag = max(flag + num, num)
    maxc = max(maxc, flag)
  end
  maxc
end

def max(x, y)
  if x > y
    x
  else
    y
  end
end
