# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length = 0)
    self.size = length
    self.store = Array.new(length)
  end

  # O(1)
  def [](index)
    within_range(index) 
    store[index]
  end

  # O(1)
  def []=(index, value)
    within_range(index)
    self.store[index] = value
  end
  
  private
  
  def within_range(index)
    if index < 0 || index >= size 
      raise 'index out of bounds'
    end 
  end

  protected
  
  attr_accessor :store, :size
end
