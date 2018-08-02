#Quadratic solution - O(n^2)
def bad_two_sum?(arr, target_sum)
  result = []

  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      result << [i, j] if arr[i] + arr[j] == target_sum
    end
  end

  result.any?
end

# O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr.sort!

  arr.each_with_index do |num, i|
    dup = arr.dup
    dup.delete_at(i)
    return true if dup.bsearch {|x| (target_sum - num) - x}
  end

  false
end

#Linear O(n)
def two_sum?(arr, target_sum)
  hash = Hash.new(false)

  arr.each do |el|
    return true if hash[target_sum - el]
    hash[el] = true
  end

  false
end

# arr = [0, 1, 5, 7]
arr = [5, 1, 0, 7]
two_sum?(arr, 6) # => should be true
two_sum?(arr, 10) # => should be false
