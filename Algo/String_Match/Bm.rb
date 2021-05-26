module Bm
	SIZE = 256
	# String a 表示主串 
	# String b 表示 模式串
	def self.self a, b
		al = a.length
		bl = b.length

		# 构建坏字符哈希表
		bc = generateBC(b, bl)

		suffix, prefix = generateGS(b, bl)
		i = 0
		while i <= al - bl
			j = bl - 1
			while j >= 0
				break if a[i+j] != b[j]
				j-=1
			end
			return i if j < 0 # 匹配成功则返回第一个匹配的字符的位置
			x = j - bc[a[i+j].bytes[0]]
			y = 0
			y = moveByGS(j, bl, suffix, prefix) if j < bl - 1
			i = i + max(x, y)
		end
		return -1
	end

	# 构建坏字符哈希表
	def self.generateBC b, bl
		con = Array.new(SIZE, -1)
		(0...bl).each do |i|
			acc = b[i].bytes[0]
			con[acc] = i
		end
		con
	end

	def self.generateGS b, bl
		suffix = Array.new(bl, -1)
		prefix = Array.new(bl, false)
		(0...bl-1).each do |i|
			j = i
			k = 0
			while j >= 0 && b[j] == b[bl-1-k]
				j-=1
				k+=1
				suffix[k] = j+1
			end
			prefix[k] == true if j == -1
		end
		return suffix, prefix
	end

	def self.moveByGS j, m, suffix, prefix
		k = m - 1 - j
		return j - suffix[k] + 1 if suffix[k] != -1
		r = j + 2
		while r <= m - 1
			return r if prefix[m-r]
		end
		return m
	end

	def self.max m, n
		return m if m > n
		return n if n > m
	end

end
