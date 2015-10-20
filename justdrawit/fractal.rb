class Fractal
  BASE_SHAPE = '_'

  def initialize(level)
    puts generate_shape(nil, level)
  end

  def generate_shape(shape, n)
    if n == 0
      ['_']
    else
      shape = [' ', Fractal::BASE_SHAPE, ' ', Shape.new(shape)].join("\n")
      generate_shape(shape, n-1)
    end
  end
end

class Shape
  def initialize(lines)
    [Line.first_line, Line.second_line].join("\n")
  end
end

class Line
  def initialize(characters)
  end

  def self.first_line
    [' ', '|', ' ', '|']
  end

  def self.second_line
    ['_', ' ', '_']
  end
end

Fractal.new(1)

10.times { puts }

Fractal.new(2)
