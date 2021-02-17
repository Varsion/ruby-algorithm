=begin
	从后往前处理数组，并且每个数据都是从上往下堆化
=end
class Heap
	attr_reader :container, :capacity, :count

	def initialize capacity
	  @capacity = capacity
	  @container = Array.new(@capacity+1)
	  @count = 0
	end

	def instert value
		return -1 if count >= capacity
		++count
		container[count] = value
		_build
	end


	private
		def _build
			#for(i = self.capacity/2; i >= 1; --i)
			for i in self.capacity/2..1
				_heapify(self.capacity, i)
			end
		end

		def _heapify x, y
			loop do
				max = y
				max = y*2 if y*2 <= x && container[y] < container[y*2]
				max = y*2+1 if y*2+1 <= n && container[max] < container[y*2+1]
				break if max == y
				_swap(container,y,max)
				y = max
			end
		end

		def _swap arr, x, y
			node = arr[x]
			arr[x] = arr[y]
			arr[y] = node
		end
end

hh = Heap.new(3)

[2,4,6].each do |x|
	hh.instert(x)
end