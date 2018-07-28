class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i+=1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |i|
      if prc.call(i)
        result << i
      end
    end
    result
  end

  def my_reject(&prc)
    self - self.my_select(&prc)
  end

  def my_any?(&prc)
    self.my_each { |i| return true if prc.call(i) }
    false
  end

  def my_all?(&prc)
    self.length == self.my_select(&prc).length
  end

  def my_flatten
    result = []
    self.my_each do |i|
      if i.class == Array
        result += i.my_flatten
      else
        result << i
      end
    end
    result
  end

  def my_zip(*args)
    result = []
    self.length.times do |i|
      arr = [self[i]]
      args.my_each { |arg| arr << arg[i] }
      result << arr
    end
    result
  end

  def my_rotate(num=1)
    self.drop(num%self.length) + self.take(num%self.length)
  end

  def my_join(sep = "")
    result = ""
    self.each_with_index do |letter, idx|
      result += sep unless idx == 0
      result += letter
    end
    result
  end

  def my_reverse
    result = []
    (self.length - 1).downto(0) do |i|
      result << self[i]
    end
    result
  end

  def bubble_sort!(&prc)
    switch_happened = true
    prc = Proc.new { |n1,n2| n1<=>n2 } unless block_given?
    while switch_happened
      switch_happened = false
      (0...self.length).each do |idx|
        if prc.call(self[idx],self[idx+1]) == 1
          self[idx],self[idx+1] = self[idx+1],self[idx]
          switch_happened = true
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def factors(num)
  (1..num).select { |i| num%i == 0 }
end

def substrings(string)
  result = []
  (0...string.length).each do |idx1|
    (idx1...string.length).each do |idx2|
      result << string[idx1..idx2]
    end
  end
  result.uniq
end

def subwords(word, dictionary)
  substrings(word).select { |word| dictionary.include?(word) }
end
