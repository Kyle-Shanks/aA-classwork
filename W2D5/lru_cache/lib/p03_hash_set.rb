class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) # key can be any data type
    unless include?(key)
      @count += 1
      resize! if self.count > num_buckets
      self[key] << key
    end
  end

  def include?(key) # key can be any data type
    self[key].include?(key)
  end

  def remove(key) # key can be any data type
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key) # key can be any data type
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_count = num_buckets * 2
    new_store = Array.new(new_count) { Array.new }

    @store.each do |bucket|
      bucket.each do |el| # el can be any data type
        new_store[el.hash % new_count] << el
      end
    end

    @store = new_store
  end
end
