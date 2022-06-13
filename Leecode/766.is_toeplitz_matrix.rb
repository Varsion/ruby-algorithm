# @param {Integer[][]} matrix
# @return {Boolean}
def is_toeplitz_matrix(matrix)
  col_len = matrix.length
  row_len = matrix[0].length

  return true if row_len == 1 || col_len == 1

  (0...col_len - 1).each do |i|
    if matrix[i][0, row_len - 1] == matrix[i + 1][1, row_len]
    else
      return false
    end
  end

  true
end

te = [
  [53, 64, 90, 98, 34],
  [91, 53, 64, 90, 98],
  [17, 91, 53, 64, 0]
]
puts is_toeplitz_matrix(te)
