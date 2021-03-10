module Match

	# Brute Force 暴力匹配
	def self.bf s, g
		goal_len = g.length
		string_len = s.length

		# 如果目标字符串比原字符串长 即 不可能包含
		return false if goal_len > string_len

		diff = string_len - goal_len

		(0..diff).each do |i|
			if s[i,goal_len] == g
				return true
			end
		end
		return false
	end

	# Rabin-Karp 
	# 将字符串转换为哈希来进行匹配 在匹配过程中 效率会高于直接匹配
	def self.rk s, g
		
	end
end