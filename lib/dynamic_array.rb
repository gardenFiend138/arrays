require_relative "static_array"

class DynamicArray < StaticArray
  attr_reader :length

  def initialize(capacity = 8)
    self.capacity = capacity
    self.length = 0
    super(length)
  end

  # O(1)
  def [](index)
    if index < 0 || index >= length 
      raise 'index out of bounds'
    end 
    # self.within_range(index)
    super
  end

  # O(1)
  def []=(index, value)
    # self.within_range(index)
    if index < 0 || index >= length 
      raise 'index out of bounds'
    end 
    super
  end

  # O(1)
  def pop
    
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
  
  def within_range(index)
    if index < 0 || index >= length 
      raise 'index out of bounds'
    end 
  end
end
