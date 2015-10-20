
system "clear"
puts "How many levels deep do you want to go?"
step_count = gets.chomp.to_i

def generate_map(step_count)
  (["R"] + r_generate_map(step_count, []).flatten).join
end


def r_generate_map(step_count, prev_map)
  if step_count == 0
    return prev_map
  else
    r_generate_map(step_count - 1, [prev_map, "L", prev_map, "R", prev_map, "R", prev_map, "L", prev_map])
  end
end

require 'rasem'

@num_steps = step_count
SCALE = 3
PATTERN = generate_map(step_count)
RANGE = SCALE * 3 ** (@num_steps)

class Point
  attr_reader :direction, :x, :y
  def initialize(direction, x, y)
    @direction = direction
    @x = x
    @y = y
  end
end

def scalar_from_direction(direction)
  case direction % 4
  when 1 then [0 ,-1]
  when 2 then [1 , 0]
  when 3 then [0 , 1]
  when 0 then [-1, 0]
  end
end

def next_point(previous_point, turn)
  old_dir = previous_point.direction
  new_dir = turn == "R" ? old_dir + 1 : old_dir - 1
  scalar = scalar_from_direction(new_dir).map { |m| m * SCALE }

  x,y = [previous_point.x + scalar[0], previous_point.y + scalar[1]]

  p [previous_point.x, previous_point.y]
  p [x, y]
  Point.new(new_dir, x, y)
end

img = Rasem::SVGImage.new(RANGE + 10, RANGE + 3) do
  previous_point = Point.new(1, 0, RANGE)
  count = PATTERN.length
  count.times do |index|
    next_p = next_point(previous_point, PATTERN[index])
    line previous_point.x, previous_point.y, next_p.x, next_p.y
    previous_point = next_p
  end
end


File.open("test.svg", "w") do |f|
  f << img.output
end

system "open -a 'Google Chrome' test.svg"
