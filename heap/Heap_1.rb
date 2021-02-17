=begin
	尽管数组中包含 n 个数据，但是我们可以假设，
	起初堆中只包含一个数据，就是下标为 1 的数据。
	然后，我们调用前面讲的插入操作，
	将下标从 2 到 n 的数据依次插入到堆中。
	这样我们就将包含 n 个数据的数组，组织成了堆。
	从前往后处理数组数据，并且每个数据插入堆中时，都是从下往上堆化
	精确的时间复杂度为(n-1)*O(logn)，因为对n-1个节点进行了堆化
=end
class Heap
	attr_reader :container, :capacity, :count

	def initialize capacity
	  @capacity = capacity
	  @container = Array.new(capacity+1)
	  @count = 0
	end

	def insert value
		return -1 if count >= capacity
		++@count
		@container[count] = value
		i = @count
		# 堆化 自底向上堆化
		while i/2 > 0 && container[i] > container[i/2]
			_swap(i, i/2)
			i = i/2
		end
	end

	# 移除堆顶元素
	def removeTop
		return -1 if count == 0
		@container[1] = @container[count]
		--@count
		_heapify(count, 1)
	end

	private
	# 堆化 自顶向下堆化
		def _heapify x, y
			loop do
				max = y
				max = y*2 if y*2 <= x && container[y] < container[y*2]
				max = y*2+1 if y*2+1 <= n && container[max] < container[y*2+1]
				break if max == i
				_swap(y,max)
				i = max
			end
		end
	# 交换下标数据位置
		def _swap x, y
			node = @container[x]
			@container[x] = @container[y]
			@container[y] = node
		end
end
