class Polygon
  def initialize(id: nil)
    card = Card.find_by(id: id)
    @is_control = card&.is_control
    @vertices = []
    points = card&.activity_area&.dig("points")
    points.each do |point|
      @vertices << [point["latitude"].round(5), point["longitude"].round(5)]
    end
  end

  def inside?(longitude, latitude)
    return false if !@is_control || @vertices.nil?

    vs = @vertices + [@vertices.first]
    xi, yi = @vertices.reduce([0,0]) { |(sx,sy),(x,y)| [sx+x, sy+y] }.map do |e|
      e.to_f/@vertices.size
    end# interior point
    x = latitude
    y = longitude
    vs.each_cons(2).all? do |(x0,y0),(x1,y1)|
      if x0 == x1 # vertical edge
        (xi > x0) ? (x >= x0) : (x <= x0)
      else
        k, slope = line_equation(x0,y0,x1,y1)
        (k + xi*slope > yi) ? (k + x*slope >= y) : (k + x*slope <= y)
      end
    end

  end

  def line_equation(x0,y0,x1,y1)
    s = (y1-y0).to_f/(x1-x0)
    [y0-s*x0, s]
  end
end