require 'matrix'

def draw(shape)
  width = `/usr/bin/env tput cols`.to_i
  halfwidth = (width - shape.length) / 2
  leftspacer = " " * halfwidth
  puts leftspacer + shape
end

def draw_multiline(shape_array)
  shape_array.each do | line |
    shape = line.join
    draw(shape)
  end
end

def rotate_right(shape_multi)
  shape_multi.reverse.transpose
end

def rotate_left(shape_multi)
  shape_multi.transpose.reverse
end

def next_shape(shape)
  " "*shape.length + shape + " "*shape.length
  rotate_left(shape) + " "*shape.length + rotate_right(shape)
end




shape = [
  [" ", " ", "-", " ", "-", " ", " "],
  ["|", " ", "|", " ", "|", " ", "|"]
]
draw_multiline(shape)

draw_multiline(rotate_left(shape))

#draw_multiline(rotate_right(shape))
