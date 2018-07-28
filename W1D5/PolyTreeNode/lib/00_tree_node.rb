class PolyTreeNode
  attr_accessor :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    parent.children.delete(self) if parent
    @parent = node
    node.children.push(self) if node
    self.parent
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "Node is not a child" unless self.children.include?(node)
    node.parent = nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target
      queue += node.children
    end
    nil
  end

  def dfs(target)
    return self if self.value == target
    return nil if self.children == []
    arr = self.children
    found = nil
    p self.value
    arr.each do |child|
      p child.value
      found = child.dfs(target)
      return found unless found.nil?
    end
    found
  end
end
