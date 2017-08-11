class LRUCache
  def initialize(size)
    @size = size
    @memory = []
  end

  def count
    # returns number of elements currently in cache
    @memory.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @memory.include?(el)
      @memory.delete(el)
      @memory << el
    elsif @memory.count >= @size
      @memory.shift
      @memory << el
    else
      @memory << el
    end 
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @memory
  end

  private
  # helper methods go here!

end
