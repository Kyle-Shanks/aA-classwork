class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    ops = ["+","/","*","-"]
    total = 0
    self.each_with_index do |el,idx|
      eval("total #{ops[idx%ops.length]}= el.hash")
    end
    total.hash
  end
end

class String
  def hash
    ops = ["+","/","*","-"]
    ords = self.chars.map(&:ord)
    total = 0
    ords.each_with_index do |ord,idx|
      eval("total #{ops[idx%ops.length]}= ord.to_f")
    end
    total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # a hash with the same keys and values in a different order should return
    # the same hash as the original

    keys = self.keys.sort_by { |el| el.to_s }
    # sorts by each key stringified since any key can be stringified
    # including arrays and hashes !
    vals = keys.map{ |key| self[key] }
    # sorts the values by the same order the stringified keys are sorted
    total = keys.hash + vals.hash
    total.hash
  end
end
