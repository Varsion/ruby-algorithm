# class Treenode
# 	attr_reader :left, :right
# 	attr_accessor :value

# 	def initialize(value)
# 	  @value = value
# 	  @left, @right = nil, nil
# 	end
# end

load "Treenode.rb"

class BinarySearchtree < Treenode
  def search value
    return self if self.value == value
    if value < self.value
      left.search value
    else
      right.search value
    end
  end

  def max
    if right.nil?
      self
    else
      right.max
    end
  end

  def min
    if left.nil?
      self
    else
      left.min
    end
  end

  def insert value
    if value > self.value
      if right.nil?
        insert_right value
      else
        right.insert value
      end
    elsif left.nil?
      insert_left value
    else
      left.insert value
    end
  end

  def delete value
    return nil if nil?

    node = search value

    if node.left.nil?
      node = node.right
    elsif node.right.nil?
      node = node.left
    else
      # 用最小右子节点替换要删除的节点 再递归删除改节点
      temp = node
      node = temp.right.min
      node.delete value
    end
  end

  private

  def insert_left value
    @left = BinarySearchtree.new(value)
  end

  def insert_right value
    @right = BinarySearchtree.new(value)
  end
end

root = BinarySearchtree.new(20)

root.insert(11)
root.insert(33)
