class Travel

  attr_reader :map

  def initialize(map, start_point)
    @map, @start_point = map, start_point
  end

  def find_way_to(target_point)
    road = [Point.new(@start_point.x, @start_point.y)]

    until road.empty?
      current_point = road.shift

      if current_point.x == target_point.x and current_point.y == target_point.y
        return current_point
      else
        x = current_point.x
        y = current_point.y
        map.visited_point(x, y)
        road << Point.new(x + 1, y, current_point) if map.have_point_at?(x + 1, y)
        road << Point.new(x - 1, y, current_point) if map.have_point_at?(x - 1, y)
        road << Point.new(x, y + 1, current_point) if map.have_point_at?(x, y + 1)
        road << Point.new(x, y - 1, current_point) if map.have_point_at?(x, y - 1)
      end
    end
  end

end