# class Treenode
# 	attr_reader :left, :right
# 	attr_accessor :value

# 	def initialize(value)
# 	  @value = value
# 	  @left, @right = nil, nil
# 	end
# end

class Binarytree < Treenode

# 前序遍历
	def preOrder root
		return nil if !root

		puts root.value
		preOrder root.left
		preOrder root.right
	end
# 中序遍历
	def midOrder root
		return nil if !root

		midOrder root.left
		puts root.value
		midOrder root.right
	end
# 后序遍历
	def postOrder root
		return nil if !root

		postOrder root.left
		postOrder root.right
		puts root.value
	end
end