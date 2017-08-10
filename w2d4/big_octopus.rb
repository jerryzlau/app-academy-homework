fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# --------------------------Sluggish Octopus----------------------------

def sluggish_octopus(fishes)
  biggest_fish = nil
  fishes.each_with_index do |fish, idx|
    (idx+1...fishes.length).each do |idxx|
      biggest_fish = fishes[idxx] if fish < fishes[idxx]
    end
  end
  biggest_fish

end

# --------------------------Dominant Octopus----------------------------

def dominant_octopus(fishes)
  merge_sort(fishes).last
end

def merge_sort(array)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx)),
    merge_sort(array.drop(mid_idx))
  )
end

def merge(left, right)
  merged_array = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end

# --------------------------Clever Octopus------------------------------
def clever_octopus(fishes)
  biggest_fish = ""
  fishes.each do |fish|
    biggest_fish = fish if fish.length >= biggest_fish.length
  end
  biggest_fish
end

# --------------------------Dancing Octopus-----------------------------
# --------------------------Slow Dance----------------------------------
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dance_move, tiles_array)
  tiles_array.each_with_index do |moves, idx|
    return idx if moves == dance_move
  end
end

# --------------------------Constant Dance------------------------------
tiles_hash = { "up" => 0,
               "right-up" => 1,
               "right"=> 2,
               "right-down" => 3,
               "down" => 4,
               "left-down" => 5,
               "left" => 6,
               "left-up" => 7
              }

def fast_dance(dance_move, tiles_hash)
  tiles_hash[dance_move]
end
