class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    res = []
    loop do 
        if l1
            res << l1.val
            l1 = l1.next
        end
        if l2
            res << l2.val
            l2 = l2.next
        end
        break if l1.nil? && l2.nil?
    end
   res.sort
end