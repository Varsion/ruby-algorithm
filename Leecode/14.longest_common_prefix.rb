# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  # len = strs.length
  # flag = []
  # strs[len - 1].chars.each do |i|
  # 	flag.push i
  # end
  return "" if strs.length < 1
  i = 0
  pref = ""
  while i < strs.map(&:length).min
    target = strs[0][i]
    if strs.all? { |e| e[i] == target }
      pref += target
    else
      return pref
    end
    i += 1
  end
  pref
end

puts longest_common_prefix ["flower", "flow", "flight"]
