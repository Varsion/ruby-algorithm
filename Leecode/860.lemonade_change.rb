# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
  five = 0
  ten = 0
  twenty = 0
  flag = true
  bills.each do |i|
    case i
    when 5
      five += 1
    when 10
      five -= 1
      ten += 1
    else
      twenty += 1
      if ten < 1
        five -= 3
      else
        ten -= 1
        five -= 1
      end
    end

    if five < 0
      flag = false
      break
    end
  end

  flag
end
