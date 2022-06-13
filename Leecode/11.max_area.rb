# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  return nil if height.nil?

  con = 0
  f1 = 0
  f2 = height.length - 1

  while f1 < f2
    con_now = if height[f1] < height[f2]
      (f2 - f1) * height[f1]
    else
      (f2 - f1) * height[f2]
    end

    con = con_now if con_now > con

    if height[f1] < height[f2]
      f1 += 1
    else
      f2 -= 1
    end
  end
  con
end

p max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])
