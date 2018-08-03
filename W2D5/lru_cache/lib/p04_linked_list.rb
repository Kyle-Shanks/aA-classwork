class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new(:head)
    @tail = Node.new(:tail)

    self.head.next = self.tail
    self.tail.prev = self.head

    # head and tail are actually sentinel nodes (placeholders)
    # but they are not part of the actual list
  end

  def [](i)
    current_node = self.head.next
    index = 0

    until index == i || current_node == self.tail
      index += 1
      current_node = current_node.next
    end

    current_node unless current_node == self.tail
  end

  def first
    self.head.next unless self.head.next == self.tail
  end

  def last
    self.tail.prev unless self.tail.prev == self.head
  end

  def empty?
    self.head.next == self.tail

    # if node after head is not tail, then there exists at least one node
    # in between
    # so the list is not empty
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key,val)

    if last # if there is a node between head and tail
      new_node.prev = last
      last.next = new_node
    else # place the node between head and tail and do reassignments
      new_node.prev = self.head
      self.head.next = new_node
    end

    self.tail.prev = new_node
    new_node.next = self.tail

    new_node
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    self.each do |node|
      node.remove if node.key == key
    end
  end

  def each
    current_node = self.head.next

    until current_node == self.tail
      yield(current_node)

      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
