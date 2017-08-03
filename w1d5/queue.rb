class Queue
  def initialize
    # create ivar to store queue here!
    @queue = []
  end

  def enqueue(el)
    # adds an element to the queue
    @queue << el
  end

  def dequeue
    # removes one element from the queue
    @queue.shift
  end

  def show
    # return a copy of the queue
    @queue
  end
end
