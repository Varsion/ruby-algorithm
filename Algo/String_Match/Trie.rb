#   只有字母的Trie树

class Trie
  def initialize(attribute)
    @attribute = attribute
  end
end

class Trienode
  attr_accessor :data, :children

  def initialize data
    @data = data
    @children = Array.new(26, nil)
  end
end

T = Trienode.new(1)
