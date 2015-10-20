require 'json'

class Fractal

  def self.draw_square(size, center)
    top_y = right_x = center + size / 2.0
    bottom_y = left_x = center - size / 2.0

    { top_left: [left_x, top_y],
      top_right: [ right_x,top_y],
      bottom_left: [left_x, bottom_y],
      bottom_right: [right_x, bottom_y]
    }.to_json
  end  
end
