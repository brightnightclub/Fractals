class Fractal
  BASE_SHAPE = '_'
  SIDE_SHAPE = '|'

  def initialize(level)
    $width = 2*level + 1
    puts generate_shape(BASE_SHAPE, level)
  end

  def generate_shape(shape, n)
    # base case
    if n == 1
      line = " "*$width
      line[$width/2] = BASE_SHAPE
      line
    else
      rotate(generate_shape(shape, n-1)) +
      rotate(generate_shape(shape, n-1))
    end
  end

  def rotate(string)
    string.each_char.map do |char|
      case char
      when BASE_SHAPE
        SIDE_SHAPE
      when SIDE_SHAPE
        BASE_SHAPE
      else
        char
      end
    end.join()
  end
end

module Kernel
  def puts(s)
    $buffer = '' if $buffer == nil
    $buffer += s + "\n"
  end
end

fractals = 9.times do |i|
  Fractal.new(i+1)
end

$buffer.each_char do |char|
  print char
  sleep(0.001)
end

# Fractal.new(1)
#
# 10.times { puts }
#
# Fractal.new(2)
#
# 10.times { puts }
#
# Fractal.new(3)
