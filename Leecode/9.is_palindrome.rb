# @param {Integer} x
# @return {Boolean}
# 判断一个整数是否是回文数。回文数是指正序和倒序读都是一样的整数。
def is_palindrome x
  res = x.to_s
  x == res.reverse
end
