class Array
  def second
    self[1]
  end
end


class Map
  def initialize
    @map = []
  end

  def assign(key, value)
     @map.each_with_index do |kv_pair, idx|
       if kv_pair.first == key
         @map[idx] = [key, value]
         return @map[idx]
       end
     end
     @map << [key, value]
  end

  def lookup(key)
    @map.each do |kv_pair|
      return kv_pair.second if kv_pair.first == key
    end
    false
  end

  def remove(key)
    @map.each_with_index do |kv_pair, idx|
      if kv_pair.first == key
        @map.delete_at(idx)
        return kv_pair
      end
    end
    false
  end

  def show
    @map
  end
end
