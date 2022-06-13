# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  pre = -2
  c = 0
  flowerbed.each_with_index do |v, i|
    next if v == 0
    c += (i - pre - 2) / 2
    pre = i
  end
  c += ((flowerbed.size + 1) - pre - 2) / 2
  c >= n
end
