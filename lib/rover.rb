class Rover

  attr_accessor :x, :y, :heading

  def initialize(x: 0, y: 0, heading: "N")
    @x = x, @y = y
    @heading = heading
  end
end
