require_relative 'lib/travel'
require_relative 'lib/map'
require_relative 'lib/point'

simple_map = %Q{
XXXXXXXXXXXXXX
XXXXXXXX     X
XXXXXXXX     X
X  XXXXX XXX X
X     XX X   X
X   X    XXX X
XXX X    X   X
XXX   XXXXXXXX
XXXXXXXXXXXXXX
}.strip

simple_map = simple_map.split("\n").map { |line|
  line.split('')
}

travel = Travel.new(Map.new(simple_map), Point.new(1, 4))
way = travel.find_way_to(Point.new(10, 4))

while !way.nil?
  simple_map[way.y][way.x] = '-'
  way = way.previous_brick
end

puts simple_map.inject('') { |map, tr| map + tr.join('') + $/ }