class Kmp
	def self.self a, b
		al = a.length
		bl = b.length
		ne = getNexts(b, bl)

		j = 0

		(0...al).each do |i|
			while j>0 && a[i] != b[j]
				j = ne[j-1] + 1
			end
			j+=1 if a[i] == b[j]

			return i - bl + 1 if j == bl
		end
		return -1
	end

	def self.getNexts b, bl
		ne = Array.new(bl)
		ne[0] = -1
		k = -1
		(1...bl).each do |i|
			while k != -1 && b[k+1] != b[i]
				k = ne[k]
			end
			k+=1 if b[k+1] == b[i]
			ne[i] = k
		end
		return ne
	end
end