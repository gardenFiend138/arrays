require_relative "static_array"

class RingBuffer < StaticArray
  attr_reader :length

  def initialize(capacity = 8)
    self.capacity = capacity 
    self.length = 0 
    self.start_idx = 0
    super(capacity)
  end

  # O(1)
  def [](index)
    # within_range(index)
    raise "index out of bounds" if index < 0 || index >= length
    super((index + start_idx) % capacity)
  end

  # O(1)
  def []=(index, val)
    # within_range(index)
    raise "index out of bounds" if index < 0 || index >= length
    super((index + start_idx) % capacity, val)
  end

  # O(1)
  def pop
    last = self[length - 1]
    self[length - 1] = nil 
    self.length -= 1
    last
  end

  # O(1) ammortized
  def push(val)
    resize! if !check_index(length)
    self.length += 1
    self[length - 1] = val 
  end

  # O(1)
  def shift
    first = self[0]
    self[0] = nil 
    self.start_idx = (start_idx + 1) % capacity
    self.length -= 1
    first
  end

  # O(1) ammortized
  def unshift(val)
    resize! if !check_index(length)
    self.start_idx = (start_idx - 1) % capacity
    self.length += 1
    self[0] = val 
    self
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    index < capacity
  end

  def resize!
    self.capacity = 1 if capacity < 1
    new_store = StaticArray.new(capacity * 2)
    capacity.times do |idx|
    new_store[idx] = self[idx]
    end 
    self.start_idx = 0
    self.store = new_store
    self.capacity = capacity * 2
    self.size = capacity
    self
  end

# def within_range(index)
  #   if index < 0 || index >= length 
  #     raise 'index out of bounds'
  #   end 
  # end
end






