=begin
	- bubble sort
	- insert sort
	- select sort
	- merge sort
	- quick sort
=end
module Sort
	# bubble sort
	# Time Complexity: О(n^2)
	# Space Complexity: О(n) total, O(1) auxiliary
	# Stable: Yes
	# Sort.bubble_sort(arr) [1,3,2,7,6] => [1,2,3,6,7]
	def self.bubble_sort container
		loop do
			swapped = false
			(container.size-1).times do |i|
			if(container[i] <=> container[i+1]) == 1
					container[i], container[i+1] = container[i+1], container[i]
	      			swapped = true
	      		end
			end
			break unless swapped
		end
		container
	end

	# insert sort
	# Time Complexity: О(n^2)
	# Space Complexity: О(n) total, O(1) auxiliary
	# Stable: Yes
	# Sort.insert_sort(arr) [1,3,2,7,6] => [1,2,3,6,7]
	def self.insert_sort container
		return container if container.size < 2
		(1..container.size-1).each do |i|
			value = container[i]
			j = i-1
			while j >= 0 and container[j] > value do
				container[j+1] = container[j]
				j = j - 1
			end
			container[j+1] = value
		end
		container
	end

	# select sort
	# Time Complexity: О(n^2)
	# Space Complexity: О(n) total, O(1) auxiliary
	# Stable: Yes
	# Sort.select_sort(arr) [1,3,2,7,6] => [1,2,3,6,7]
	def self.select_sort container
		0.upto(container.size-1) do |i|
			min = i
			(i+1).upto(container.size-1) do |j|
        		min = j if (container[j] <=> container[min]) == -1
			end
      		container[i], container[min] = container[min], container[i] # Swap
      	end
      	container
	end

	# merge sort
	def self.merge_sort container
		# TODO: 实现归并排序
		
	end

	def self.qucik_sort container
		# TODO: 实现快速排序
	end

end

# Test
p Sort.bubble_sort([1,3,2,7,6])
puts "-----"
p Sort.insert_sort([1,3,2,7,6])
puts "-----"
p Sort.select_sort([1,3,2,7,6])
puts "-----"