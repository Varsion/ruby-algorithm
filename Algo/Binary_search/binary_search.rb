# Simple binary search
def bsearch container, value
  low = 0
  high = container.length - 1

  while low <= high
    mid = (low + high) / 2
    if container[mid] == value
      return mid
    elsif container[mid] < value
      low = mid + 1
    else
      high = mid - 1
    end
  end
  -1
end

# Recursive binary search
def bsearch_re container, value
  len = container.length
  dsearchInternal(container, 0, len - 1, value)
end

def dsearchInternal container, low, high, value
  return -1 if low > high
  mid = low + ((high - low) >> 1)
  if container[mid] = value
    mid
  elsif container[mid] < value
    dsearchInternal(container, mid + 1, high, value)
  else
    dsearchInternal(container, low, mid - 1, value)
  end
end
