require_relative 'array_dup'

class Map
  using ArrayDup

  attr_reader :map

  def initialize(map)
    @map = map.dup
  end

  def have_point_at?(x, y)
    !map[y].nil? and !map[y][x].nil? and map[y][x] != 'X'
  end

  def visited_point(x, y)
    map[y][x] = 'X'
  end
end