=begin
	只有字母的Trie树
=end

class Trie

	def initialize(attribute)
	  @attribute = attribute
	end

end

class Trienode
	attr_accessor :data, :children

	def initialize data
	  @data = data
	  #@children[26] = Trienode.new
	end
end


T = Trienode.new(1)