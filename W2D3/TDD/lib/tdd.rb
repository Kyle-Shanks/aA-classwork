class Array
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el, idx|
      (idx...self.length).each do |idx2|
        if el + self[idx2] == 0 && idx != idx2
          result << [idx, idx2]
        end
      end
    end
    result
  end

  def my_transpose
    return self if self.empty?
    result = Array.new(self.length) { [] }
    i = 0
    while i < self[0].length
      self.each { |el| result[i] << el[i] }
      i+=1
    end
    result
  end

  def stock_picker
    self.price_differences.sort_by {|array| array.first}.last[1..-1]
  end

  protected
  def price_differences
    (self[0..-2]).map.with_index do |el, idx|
      map = self[idx...self.length].map.with_index do |el2, idx2|
        [el2 - el, idx, idx2]
      end
      map.sort_by { |array| array[0] }.last
    end
  end
end
