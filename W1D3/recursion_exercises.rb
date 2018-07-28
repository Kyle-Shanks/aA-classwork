require "byebug"

# Recursive Range
def range(first,last)
  return [] if last <= first
  [first] + range(first+1,last)
end

# Recursive & iterative versions of sum for arrays
def rec_sum(arr)
  return 0 if arr.length == 0
  return arr.first if arr.length == 1
  arr.first + rec_sum(arr[1..-1])
end

def itr_sum(arr)
  result = 0
  arr.each {|num| result += num}
  result
end

# Recursive Exponent Functions
# Method 1
def exp1(b, n)
  return 1 if n == 0

  if n < 0
    1.0 / (b * exp1(b, n.abs - 1))
  else
    b * exp1(b, n.abs - 1)
  end
end

# Method 2
def exp2(b,n)
  return 1 if n == 0
  return b if n == 1

  if n.even?
    exp2(b,n/2)**2
  else
    b * (exp2(b,(n-1)/2)**2)
  end
end

# Deep Dup
class Array
  def deep_dup
    output = []
    self.each do |el|
      output << (el.is_a?(Array) ? el.deep_dup : el)
    end
    output
  end
end

# Fibonacci
def fibs(n)
  base_arr = [0,1]
  return base_arr[0,n] if n <= 2

  arr = fibs(n-1)
  arr << arr[-2] + arr[-1]
  arr
end

# Binary Search
def bsearch(array, target)
  return nil if (array.length == 1) && (array.first != target)
  mid_index = (array.length / 2)
  if target > array[mid_index]
    upper_index = bsearch(array[(mid_index)..-1], target)
    upper_index ? (upper_index + mid_index) : upper_index
  elsif target < array[mid_index]
    bsearch(array[0...mid_index], target)
  else
    return mid_index
  end
end

# Merge Sort
def merge_sort(arr)
  return arr if arr.length <= 1
  mid_index = arr.length/2
  left_half = arr[0...mid_index]
  right_half = arr[mid_index..-1]

  merge(merge_sort(left_half),merge_sort(right_half))
end

# Merge Helper Method
def merge(left,right)
  return right if left.empty?
  return left if right.empty?

  if left[0] < right[0]
    [left[0]] + merge(left[1..-1],right)
  else
    [right[0]] + merge(left,right[1..-1])
  end
end

# Array Subsets
class Array
  def subsets
    return self if self.length == 0
    output = [self]
    self.each_with_index do |_,idx|
      inner_arr = (self[0...idx]+self[idx+1..-1]).subsets
      if inner_arr.empty?
        output << inner_arr
      else
        output += inner_arr
      end
    end
    output.uniq
  end
end

# Permutations
def permutations(arr)
  return [arr] if arr.length <= 1
  result = []
  arr.each_with_index do |el,idx|
    sub_arr = arr[0...idx ]+arr[idx+1..-1]
    permutations(sub_arr).each { |sa| result << [el]+sa }
  end
  result
end

#make greedy change
def greedy_make_change(amt, coins = [25, 10, 5, 1])
  return [amt] if coins.any? {|coin| coin == amt}
  max_coin = coins.reject {|coin| coin > amt}.max
  [max_coin] + greedy_make_change(amt - max_coin, coins)
end

# Make better change
