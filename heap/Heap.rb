=begin
	- 堆是一个完全二叉树；
	- 堆中每一个节点的值都必须大于等于（或小于等于）其子树中每个节点的值。
	- 对于每个节点的值都大于等于子树中每个节点值的堆，称为“大顶堆”。
	- 对于每个节点的值都小于等于子树中每个节点值的堆，称为“小顶堆”
=end
class Heap
	attr_reader :container, :capacity, :count

	def initialize capacity
	  @capacity = capacity
	  @container = Array.new(@capacity+1)
	  @count = 0
	end

	def insert value
		return -1 if count >= capacity
		++count
		container[count] = value
		i = count
		# 堆化 自底向上堆化
		while i/2 > 0 && container[i] > a[i/2]
			_swap(@container, i, i/2)
			i = i/2
		end
	end

	# 移除堆顶元素
	def removeMax
		return -1 if count == 0
		container[1] = container[count]
		--count
		_heapify(container, count, 1)
	end

	private
	# 堆化 自顶向下堆化
		def _heapify arr, x, y
			loop do
				max = y
				max = y*2 if y*2 <= x && container[y] < container[y*2]
				max = y*2+1 if y*2+1 <= n && container[max] < container[y*2+1]
				break if max == i
				_swap(container,y,max)
				i = max
			end
		end
	# 交换下标数据位置
		def _swap arr, x, y
			node = arr[x]
			arr[x] = arr[y]
			arr[y] = node
		end
end
