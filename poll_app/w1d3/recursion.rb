require 'byebug'

def range(beg, fin)
  results = []
  return [] if fin < beg
  return [beg] if beg == fin
  results = range(beg, fin -1) + [fin]

end

def sum_recursive(arr)
  return arr.pop if arr.length == 1
  arr.pop + sum_recursive(arr)
end

def sum_iterative(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end
  sum

end

def exp_1(b,n)
  return 1 if n == 0
  b * exp_1(b, n -1)
end

def exp_2(b,n)
  return 1 if n == 0
  return b if n == 1
  if n % 2 == 0
    exp = exp_2(b, n / 2)
    return exp * exp
  end
  exp = exp_2(b, (n - 1) / 2 )
  b * exp * exp
end

def dup_deep(arr)
  results = []
  arr.each do |el|
    if el.is_a? Array
      results << dup_deep(el)
    else
      results<< el
    end
  end
  results
end

def fibonacci_recursive(n)
  return [1] if n==1
  return [1,1] if n ==2 ## ?
  tally = fibonacci_recursive(n-1)
  tally + [tally.last + tally[-2]]
end

def fibonacci_iterative1(n)
  return [1] if n == 1
  return [1,1] if n == 2
  results = [1,1]
  (3..n).each do |index|
    results << (results[index - 1] + results[index - 2 ])
  end
end

def fibonacci_iterative2(n)
  results = [1]
  (2..n).each do |index|
    addends1 = results[index - 1]
    addends2 = (index - 2) < 0 ? 0 : results[index - 2]
    results << (addends1 + addends2)
  end
end

def bsearch(arr, target)
  if arr.length == 1
    if arr.first == target
      return 0
    else
      return nil
    end
  end

  position_shift = 0

  middle = arr.length / 2

  left_half = arr.slice(0,middle)
  right_half = arr - left_half

  if left_half.last >= target
    return bsearch(left_half, target)
  else
    position_shift += left_half.length
    bs = bsearch(right_half,target)
    bs.nil? ? nil : bs + position_shift
  end
end

def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1

  results = []
  middle = array.length / 2
  left_half = array.slice(0, middle)
  right_half = array - left_half
  msl = merge_sort(left_half)
  msr = merge_sort(right_half)
  while msl.length > 0 && msr.length > 0

    if msl.first > msr.first
      results << msr.shift
    else
      results << msl.shift
    end
  end
  results = results + msl + msr
end

def subsets(arr)
  arr_copy = arr.dup
  return [[]] if arr_copy == []
  return [[], arr_copy] if arr_copy.length == 1
  results = []
  last = arr_copy.pop

  k = subsets(arr_copy)
  k.each do |el|
    results << ([last] + el)
    results << el
  end
  results
end

def greedy_make_change(amount, coins = [25,10,5,1])
  change = []

  while amount >= coins.first
    change << coins.first
    amount -= coins.first
  end

  if amount < coins.first && coins.length >= 2
    coins.shift
    new_change = greedy_make_change(amount, coins)
    change += new_change unless new_change.empty?
  end

  change
end



def make_better_change(amount, coins = [25,10,5,1])
  coins_copy = dup_deep(coins)
  old_amount = amount
  combos = []
  p coins_copy
  coins_copy.each do |coin, idx|
    combo = []
    new_amount = old_amount - coin
    combo << coin
    combo << greedy_make_change(new_amount, coins_copy.slice(0,(coins_copy.length)))
    combos << combo.flatten
    p coins_copy
  end

  lengths = combos.map {|comb| comb.length}
  best = lengths.index(lengths.min)
  combos[best]
end
