#   从后往前处理数组，并且每个数据都是从上往下堆化
#   - 每个节点堆化的时间复杂度是 O(logn)
#   - 堆排序的建堆过程的时间复杂度是 O(n)
class Heap
  attr_accessor :container, :capacity, :count

  def initialize(capacity)
    @capacity = capacity
    @container = Array.new(capacity + 1)
    @count = 0
  end

  def instert value
    return -1 if count >= capacity
    @count += 1
    @container[count] = value
    _build
  end

  # 移除堆顶元素
  def removeTop
    return -1 if count == 0
    @container[1] = @container[count]
    @count -= 1
    _heapify(count, 1)
  end

  # 整个堆排序的过程，都只需要极个别临时存储空间，所以堆排序是原地排序算法。
  # 堆排序包括建堆和排序两个操作 建堆过程的时间复杂度是 O(n) 排序过程的时间复杂度是 O(nlogn)
  # 堆排序整体的时间复杂度是 O(nlogn)
  # 堆排序不是稳定的排序算法
  # 在排序的过程，存在将堆的最后一个节点跟堆顶节点互换的操作，所以就有可能改变值相同数据的原始相对顺序。
  def sort
    _build
    k = count
    while k > 1
      _swap(1, k)
      k -= 1
      _heapify(k, 1)
    end
  end

  private

  # 对下标从 n/2 开始到 1 的数据进行堆化
  # 下标是 n/2 + 1 到 n 的节点是叶子节点，不需要堆化
  # 实际上，对于完全二叉树来说，下标从 n/2 + 1 到 n 的节点都是叶子节点。
  def _build
    (capacity / 2..1).each do |i|
      _heapify(capacity, i)
    end
  end

  def _heapify x, y
    loop do
      max = y
      max = y * 2 if y * 2 <= x && container[y] < container[y * 2]
      max = y * 2 + 1 if y * 2 + 1 <= n && container[max] < container[y * 2 + 1]
      break if max == y
      _swap(y, max)
      y = max
    end
  end

  def _swap x, y
    node = @container[x]
    @container[x] = @container[y]
    @container[y] = node
  end
end
