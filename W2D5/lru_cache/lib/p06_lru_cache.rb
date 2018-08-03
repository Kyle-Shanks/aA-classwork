require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key) # if in cache
      # Need to update the node
      update_node!(@map[key])
    else # not in cache
      # Need to calc!
      new_node = calc!(key)
      # add node to cache and the map
      insert(new_node)
      # check to see if cache's length is greater than max
        # if so, delete node from cache and the map
      eject! if self.count > @max
    end
    @map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    Node.new(key,@prc.call(key))
  end

  def insert(node)
    new_node = @store.append(node.key,node.val)
    @map.set(new_node.key, new_node)
    # #set takes in a key and a value
    # but we are setting the value to be a REFERENCE to the node
    # in the actual list !!
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    # Need to move to the end
    new_node = move_to_end(node)
    # return value of move_to_end(node) is the new node that we created when
    # we called append
    # save it to a variable called new_node
    @map.set(new_node.key, new_node)

    # we now pass in the reference to new_node to set !!
  end

  def move_to_end(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    @store.append(node.key,node.val)

    # return value of @store.append() is the new node that we created
    # this will also be the return value of move_to_end so we can reference it
    # in update_node!
    end
  end

  def eject!
    key = @store.first.key
    @map.delete(key)
    @store.remove(key) # O(1) since key is the first item in the linkedlist
  end
end
