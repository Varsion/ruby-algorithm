# Heap - 堆

	- 堆是一个完全二叉树；

	- 堆中每一个节点的值都必须大于等于（或小于等于）其子树中每个节点的值。

	- 对于每个节点的值都大于等于子树中每个节点值的堆，称为“大顶堆”。

	- 对于每个节点的值都小于等于子树中每个节点值的堆，称为“小顶堆”

这里实现了两种堆，更趋向于完善第一个堆

### First

从后往前处理数组，并且每个数据都是从上往下堆化
	- 每个节点堆化的时间复杂度是 O(logn)
	- 堆排序的建堆过程的时间复杂度是 O(n)


### Second

精确的时间复杂度为`(n-1)*O(logn)`，对 n-1 个节点进行了堆化


## 应用

### 优先级队列

优先级队列，顾名思义，它首先应该是一个队列，队列最大的特性就是先进先出。

在优先级队列中，数据的出队顺序不是先进先出，而是按照优先级来，优先级最高的，最先出队。

如何实现一个优先级队列呢？方法有很多，但是用堆来实现是最直接、最高效的。这是因为，堆和优先级队列非常相似。

一个堆就可以看作一个优先级队列。很多时候，它们只是概念上的区分而已。往优先级队列中插入一个元素，就相当于往堆中插入一个元素；从优先级队列中取出优先级最高的元素，就相当于取出堆顶元素。

### Top K

求 Top K 的问题抽象成两类。

- 一类是针对静态数据集合，也就是说数据集合事先确定，不会再变。
- 一类是针对动态数据集合，也就是说数据集合事先并不确定，有数据动态地加入到集合中。

针对静态数据，如何在一个包含 n 个数据的数组中，查找前 K 大数据呢？可以维护一个大小为 K 的小顶堆，顺序遍历数组，从数组中取出数据与堆顶元素比较。如果比堆顶元素大，就把堆顶元素删除，并且将这个元素插入到堆中；如果比堆顶元素小，则不做处理，继续遍历数组。这样等数组中的数据都遍历完之后，堆中的数据就是前 K 大数据了。

遍历数组需要 O(n) 的时间复杂度，一次堆化操作需要 O(logK) 的时间复杂度，所以最坏情况下，n 个元素都入堆一次，时间复杂度就是 O(nlogK)。

针对动态数据求得 Top K 就是实时 Top K。一个数据集合中有两个操作，一个是添加数据，另一个询问当前的前 K 大数据。如果每次询问前 K 大数据，都基于当前的数据重新计算的话，那时间复杂度就是 O(nlogK)，n 表示当前的数据的大小。实际上，可以一直都维护一个 K 大小的小顶堆，当有数据被添加到集合中时，就拿它与堆顶的元素对比。如果比堆顶元素大，就把堆顶元素删除，并且将这个元素插入到堆中；如果比堆顶元素小，则不做处理。这样，无论任何时候需要查询当前的前 K 大数据，都可以立刻返回给他。

### 利用堆求中位数

中位数，就是处在中间位置的那个数。如果数据的个数是奇数，把数据从小到大排列，那第 n/2+1 个数据就是中位数（注意：假设数据是从 0 开始编号的）；如果数据的个数是偶数的话，那处于中间位置的数据有两个，第 n/2 个和第 n/2+1 个数据，这个时候，可以随意取一个作为中位数，比如取两个数中靠前的那个，就是第 n/2 个数据。

**借助堆这种数据结构，可以不用排序，就非常高效地实现求中位数操作:**

需要维护两个堆，一个大顶堆，一个小顶堆。大顶堆中存储前半部分数据，小顶堆中存储后半部分数据，且小顶堆中的数据都大于大顶堆中的数据。

也就是说，如果有 n 个数据，n 是偶数，我们从小到大排序，那前 n/2 个数据存储在大顶堆中，后 n/2 个数据存储在小顶堆中。这样，大顶堆中的堆顶元素就是我们要找的中位数。如果 n 是奇数，情况是类似的，大顶堆就存储 n/2+1 个数据，小顶堆中就存储 n/2 个数据。

引物数据是动态变化的，当新添加一个数据的时候，我们应该调整两个堆，让大顶堆中的堆顶元素继续是中位数

如果新加入的数据小于等于大顶堆的堆顶元素，我们就将这个新数据插入到大顶堆；否则，我们就将这个新数据插入到小顶堆。这个时候就有可能出现，两个堆中的数据个数不符合前面约定的情况：如果 n 是偶数，两个堆中的数据个数都是 2n​；如果 n 是奇数，大顶堆有 2n​+1 个数据，小顶堆有 2n​ 个数据。这个时候，我们可以从一个堆中不停地将堆顶元素移动到另一个堆，通过这样的调整，来让两个堆中的数据满足上面的约定。

于是，就可以利用两个堆，一个大顶堆、一个小顶堆，实现在动态数据集合中求中位数的操作。插入数据因为需要涉及堆化，所以时间复杂度变成了 O(logn)，但是求中位数我们只需要返回大顶堆的堆顶元素就可以了，所以时间复杂度就是 O(1)。