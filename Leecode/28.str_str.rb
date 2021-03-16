# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?

  needle_len = needle.length
  haystack_len = haystack.length
  return -1 if needle_len > haystack_len

  (haystack_len - needle_len + 1).times do |idx|
  	target_str = haystack[idx...(idx + needle_len)]
  	return idx if needle == target_str
  end

  -1
end

s = str_str("","")
puts s