def is_multiple_of_3_or_5?(current_number)
  if current_number % 3 == 0 || current_number % 5 == 0
    return true
  else
    return false
  end
end

def sum_of_3_or_5_multiples(final_number)
  sum = 0
  for i in 0...final_number
    if is_multiple_of_3_or_5?(i)
      sum += i
    end
  end
  return sum
end
