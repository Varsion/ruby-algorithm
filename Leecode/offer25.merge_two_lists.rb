# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  # 迭代，合并两个有序链表
  l = ListNode.new(nil)
  pre = l
  while !l1.nil? && !l2.nil?
    if l1.val <= l2.val
      pre.next = l1
      pre = pre.next
      l1 = l1.next
    else
      pre.next = l2
      pre = pre.next
      l2 = l2.next
    end
  end

  pre.next = l1 unless l1.nil?
  pre.next = l2 unless l2.nil?

  l.next
end
