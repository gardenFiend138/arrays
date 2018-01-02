# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    self.store = RingBuffer.new 
    self.max_queue = RingBuffer.new 
  end

  def enqueue(val)
    if max_queue.length == 0 
      store.push(val)
      max_queue.push(val)
      return self 
    end 
    
    last = max_queue.length - 1
    if max_queue[last] == val || max_queue[last] > val 
      max_queue.push(val)
    else 
      while last >= 0 && max_queue[last] < val 
        max_queue.pop 
        last -= 1 
      end 
      
      max_queue.push(val)
    end 
    
     store.push(val)
     self
  end

  def dequeue
    max_queue.shift if max_queue[0] == store[0]
    store.shift
  end

  def max
    if max_queue.length > 0
      max_queue[0]
    end 
  end

  def length
    store.length
  end
  
  protected 
  attr_accessor :max_queue

end
