require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    b = bucket(key)
    if b.include?(key)
      b.update(key,val)
    else
      b.append(key,val)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |bucket|
      bucket.each { |node| yield(node.key, node.val) }
      # this each method may be called on a hash or node
      # the number of arguments that the block that our yield yields to may
      # take in one or two arguments

      # in the case for hashes, we pass in TWO arguments
      # (the key and the value !!)
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_count = num_buckets * 2
    new_store = Array.new(new_count) { LinkedList.new }

    @store.each do |bucket|
      bucket.each do |node|
        new_store[node.key.hash % new_count].append(node.key, node.val)
      end
    end

    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
