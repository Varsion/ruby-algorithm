# @param {Integer[][]} matrix
# @return {Integer[][]}
def transpose(matrix)
  matr_x = matrix[0].length
  matr_y = matrix.length

  array = Array.new(matr_x) { Array.new(matr_y) }
  (0...matr_y).each do |y|
    (0...matr_x).each do |x|
      array[x][y] = matrix[y][x]
    end
  end
  array
end

m = [[1, 2, 3], [4, 5, 6]]
transpose(m)
