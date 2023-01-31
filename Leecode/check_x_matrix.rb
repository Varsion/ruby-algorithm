# @param {Integer[][]} grid
# @return {Boolean}
# https://leetcode.cn/problems/check-if-matrix-is-x-matrix/
def check_x_matrix(grid)
  len = grid.length
  grid.each_with_index do |row, i|
    row.each_with_index do |item, j|
      if i == j || i + j == len - 1
        return false if item == 0
      elsif item != 0
        return false
      end
    end
  end
  true
end