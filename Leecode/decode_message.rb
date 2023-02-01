# @param {String} key
# @param {String} message
# @return {String}
# https://leetcode.cn/problems/decode-the-message/
def decode_message(key, message)
  origin = key.split(//).delete_if do |item|
    item == " "
  end

  flag = 97
  # 97.chr => "a"
  refer = {}
  origin.each_with_index do |item, i|
    unless origin[0...i].include?(item)
      refer.merge!({
        item => flag.chr
      })
      flag = flag + 1
    end
  end

  result = ""
  x = message.split(//)
  x.each do |item|
    if refer.key?(item)
      result << refer[item]
    else
      result << item
    end
  end
  result
end