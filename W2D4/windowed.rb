# O(n^2) Quadratic
def windowed_max_range(array, window_size)
  current_max_range = nil

  (0..(array.length-window_size)).each do |idx|
    group = array[idx,window_size]
    range = group.max - group.min
    current_max_range = range if current_max_range.nil?
    current_max_range = range if range > current_max_range
  end

  current_max_range
end



class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end
end

class MinMaxStack
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @min.pop if @min.last == @store.last
    @max.pop if @max.last == @store.last
    @store.pop
  end

  def push(el)
    @min << el if @min.empty? || el < @min.last
    @max << el if @max.empty? || el > @max.last
    @store.push(el)
  end

  def max
    @max.last
  end

  def min
    @min.last
  end
end

class StackQueue
  def initialize
    @input_stack = MyStack.new
    @output_stack = MyStack.new
  end

  def size
    @input_stack.size + @output_stack.size
  end

  def empty?
    @input_stack.empty? && @output_stack.empty?
  end

  def enqueue(el)
    @input_stack.push(el)
  end

  def dequeue
    if @output_stack.empty?
      @input_stack.size.times do
        @output_stack.push(@input_stack.pop)
      end
    end
    @output_stack.pop
  end
end

class MinMaxStackQueue
  def initialize
    @input_stack = MinMaxStack.new
    @output_stack = MinMaxStack.new
  end

  def size
    @input_stack.size + @output_stack.size
  end

  def empty?
    @input_stack.empty? && @output_stack.empty?
  end

  def enqueue(el)
    @input_stack.push(el)
  end

  def dequeue
    if @output_stack.empty?
      @input_stack.size.times do
        @output_stack.push(@input_stack.pop)
      end
    end
    @output_stack.pop
  end

  def max
    return @input_stack.max if @output_stack.empty?
    return @output_stack.max if @input_stack.empty?
    [@input_stack.max, @output_stack.max].max
  end

  def min
    return @input_stack.min if @output_stack.empty?
    return @output_stack.min if @input_stack.empty?
    [@input_stack.min, @output_stack.min].min
  end

end

# O(n) - Linear
def new_windowed_max_range(array, window_size)
  queue = MinMaxStackQueue.new
  window_size.times { |i| queue.enqueue(array[i]) }
  current_max_range = queue.max - queue.min
  (array.length - window_size).times do |i|
    queue.dequeue
    queue.enqueue(array[i + window_size])
    new_range = queue.max - queue.min
    current_max_range = new_range if new_range > current_max_range
  end

  current_max_range
end


#
# new_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
