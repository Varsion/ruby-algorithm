=begin
	从后往前处理数组，并且每个数据都是从上往下堆化
=end
class Heap
	attr_accessor :container, :capacity, :count

	def initialize(capacity)
	  @capacity = capacity
	  @container = Array.new(capacity+1)
	  @count = 0
	end


end