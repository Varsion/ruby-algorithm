class CQueue
  def initialize
    @stack_in = []
    @stack_out = []
  end

  #     :type value: Integer
  #     :rtype: Void
  def append_tail value
    @stack_in.push(value)
  end

  #     :rtype: Integer
  def delete_head
    return -1 if @stack_in.empty?

    @stack_in.length.times do
      @stack_out.push(@stack_in.pop)
    end

    res = @stack_out.pop

    @stack_out.length.times do
      @stack_in.push(@stack_out.pop)
    end

    res
  end
end

# Your CQueue object will be instantiated and called as such:
# obj = CQueue.new()
# obj.append_tail(value)
# param_2 = obj.delete_head()
