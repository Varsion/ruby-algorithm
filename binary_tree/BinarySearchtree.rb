# class Treenode
# 	attr_reader :left, :right
# 	attr_accessor :value

# 	def initialize(value)
# 	  @value = value
# 	  @left, @right = nil, nil
# 	end
# end

load 'Treenode.rb'

class BinarySearchtree < Treenode

	def find value
		return self if self.value == value
		if value < self.value
			self.left.find value
		else
			self.right.find value
		end
	end

	def max_node
		if self.right == nil
			return self
		else
			self.right.max_node
		end
	end

	def min_node
		if self.left == nil
			return self
		else
			self.left.max_node
		end
	end

	def insert value
		if value > self.value
			if self.right == nil
				insert_right value
			else
				self.right.insert value
			end
		else
			if self.left == nil
				insert_left value
			else
				self.left.insert value
			end
		end
	end

	def delete
		
	end

	private
		def insert_left value
			@left = BinarySearchtree.new(value)
		end

		def insert_right value
			@right = BinarySearchtree.new(value)
		end
end