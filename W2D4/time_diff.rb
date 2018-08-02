list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)

#Quadratic solution
def my_min(array)
  array.find do |el|
    array.all? {|el2| el2 >= el}
  end
end

#Linear solution
def my_min(array)
  min = array.first
  array.each {|el| min = el if el < min}
  min
end


#Quadratic solution
def largest_cont_sum(array)
  subarrays = []

  (0...self.length).each do |i|
    (i...self.length).each do |j|
      subarray = self[i..j]
      subarrays << subarray
    end
  end # O(n^2)

  max = nil
  subarrays.each do |pair|
    sum = pair[0] + pair[1]
    max = sum if max.nil?
    max = sum if sum > max
  end #>> O(n)

  max
end

# Linear time, Constant space
def better_largest_cont_sum(array)
  largest = 0
  current = 0

  array.each do |n|
    current += n
    largest = current if current > largest
    current = 0 if current < 0
  end

  largest
end #>> O(n) + O(1)
