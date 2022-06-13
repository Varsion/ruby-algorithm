# @param {String} s
# @return {Integer}
# 对字符串从左到右来，如果当前字符代表的值不小于其右边，就加上该值；否则就减去该值。以此类推到最左边的数
def roman_to_int s
  roma = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
  count = 0
  (0...s.length).each do |i|
    if i != s.length - 1
      if roma[s[i]] < roma[s[i + 1]]
        count -= roma[s[i]]
      else
        count += roma[s[i]]
      end
    else
      count += roma[s[i]]
    end
  end
  count
  # (0...s.length).reverse_each do |i|

  # end
end

puts roman_to_int "IV"
