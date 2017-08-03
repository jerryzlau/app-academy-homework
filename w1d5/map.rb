class Map
  def initialize
    # create ivar to store map here!
    @map = []
  end

  def assign(key, value)
    # adds an element to the map
    keys = []
    @map.each {|el| keys << el.first}

    if keys.include?(key)
      @map.each do |el|
        if el.first == key
          el.pop
          el.push(value)
        end
      end
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    # look up one element from the map
    @map.select {|el| el.first == key}.last
  end

  def remove(key)
    # remove element with specified key
    @map.reject! {|el| el.first == key}
  end

  def show
    # return a copy of the map
    @map
  end
end
