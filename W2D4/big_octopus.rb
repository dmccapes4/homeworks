require 'byebug'

fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
              'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)
  swapped = true
  while swapped
    swapped = false
    fishes[0...fishes.length - 1].each_index do |idx|
      if fishes[idx].length > fishes[idx + 1].length
        fishes[idx], fishes[idx + 1] = fishes[idx + 1], fishes[idx]
        swapped = true
      end
    end
  end
  fishes
end


def dominant_octopus(fishes)
  return fishes if fishes.length <= 1
  mid_idx = fishes.length / 2
  left_sorted = dominant_octopus(fishes.take(mid_idx))
  right_sorted = dominant_octopus(fishes.drop(mid_idx))
  dominant_helper(left_sorted, right_sorted)
end

def dominant_helper(fishes_left, fishes_right)
  dominated = []
  until fishes_left.empty? || fishes_right.empty?
    if fishes_left.first.length < fishes_right.first.length
      dominated << fishes_left.shift
    else
      dominated << fishes_right.shift
    end
  end
  dominated += fishes_left + fishes_right
end

tiles_array = ["up", "right-up", "right", "right-down",
              "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == dir
  end
end

tiles_hash = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
  "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7
}
